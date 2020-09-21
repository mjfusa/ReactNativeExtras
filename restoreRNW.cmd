rem restoreRNW RNClock wclock
git clone https://mjfusa.visualstudio.com/DefaultCollection/Samples/_git/%1
if "%2"=="" cd %1\react-native-%1
if "%2" NEQ "" cd %1\react-native-%2
git submodule update --init --recursive
npm install --save-dev --ignore-scripts install-peers
npm install --only=dev
npm install react-native-windows@0.63

