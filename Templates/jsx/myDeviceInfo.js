import { NativeModules } from 'react-native';
import React from 'react';
import {
    StyleSheet,
    View,
    Text,
    StatusBar,
    Button
  } from 'react-native';

  import {
    Colors,
  } from 'react-native/Libraries/NewAppScreen';
  
class DeviceInfoComponent extends React.Component {
    constructor(props) {
      super(props);
  
      this.state = {
        model: '',
      }
    }
  
    getDeviceModel = () => {
        return new Promise((resolve, reject) => {
          var vm = NativeModules.NativeModuleClass;
            vm.deviceModel(function(result, error) {
                if (error) {
                    reject(error);
                }
                else {
                    resolve(result);
                }
            })
        })
    }

    getModel = async () => {
      var model = await this.getDeviceModel();
      this.setState( { model: model});
    }
  
    render() {
      return (
        // <View style={styles.sectionContainer}>
        //  <StatusBar barStyle="dark-content" /> 
     <View>
             <Button title="Get model" onPress={this.getModel} /> 
             <Text>{this.state.model}</Text>
        </View>
        // </View> 
      );
    }
}

const styles = StyleSheet.create({
    scrollView: {
      backgroundColor: Colors.lighter,
    },
    engine: {
      position: 'absolute',
      right: 0,
    },
    body: {
      backgroundColor: Colors.white,
    },
    sectionContainer: {
      marginTop: 32,
      paddingHorizontal: 24,
    },
    sectionTitle: {
      fontSize: 24,
      fontWeight: '600',
      color: Colors.black,
    },
    sectionDescription: {
      marginTop: 8,
      fontSize: 18,
      fontWeight: '400',
      color: Colors.dark,
    },
    highlight: {
      fontWeight: '700',
    },
    footer: {
      color: Colors.dark,
      fontSize: 12,
      fontWeight: '600',
      padding: 4,
      paddingRight: 12,
      textAlign: 'right',
    },
  });
  
  
module.exports = {
    DeviceInfoComponent,
  };