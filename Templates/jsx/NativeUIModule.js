import React, { Component } from 'react';
import {
  AppRegistry,
  Button,
  requireNativeComponent,
  NativeModules,
  StyleSheet,
  UIManager,
  View,
  Text,
  findNodeHandle
} from 'react-native';

let CustomUserControl = requireNativeComponent('CustomUserControl');

var log = function(result) {
  console.log(result);
  //NativeModules.DebugConsole.Log('' + result); // TODO: Implement DebugConsole
};

class ViewManagerSample extends React.Component {
  onPressCustomUserControlCpp() {
    log('SampleApp.onPressCustomUserControlCpp()');

    var strArg = 'Hello World!';

    if (this._CustomUserControlCppRef)
    {
      const tag = findNodeHandle(this._CustomUserControlCppRef);
      log(`UIManager.dispatchViewManagerCommand(${tag}, CustomUserControlCpp.CustomCommand, "${strArg}")`);
      // UIManager.dispatchViewManagerCommand(tag, UIManager.getViewManagerConfig('CustomUserControlCpp').Commands.CustomCommand, strArg); // TODO: Expose Commands
    }
  }

  onLabelChangedCustomUserControlCpp(evt) {
    var label = evt.nativeEvent;
    log(`SampleApp.onLabelChangedCustomUserControlCpp("${label}")`);
  }

    render() {
    return (
      <View>
         <CustomUserControl style={styles.customcontrol} label="CustomUserControlCpp!" ref={(ref) => { this._CustomUserControlCppRef = ref; }} onLabelChanged={(evt) => { this.onLabelChangedCustomUserControlCpp(evt); }} />
        <Button onPress={() => { this.onPressCustomUserControlCpp(); }} title="Call CustomUserControlCpp Commands!" />
      </View>);
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  customcontrol: {
    color: '#333333',
    backgroundColor: '#006666',
    width: 200,
    height: 20,
    margin: 10,
  },
});

module.exports = {
  ViewManagerSample,
};

