# java-script-core-ios

based on [react-native#v0.57.5](https://github.com/facebook/react-native/tree/v0.57.5)

## Usage

copy ios-configure-glog.sh to your project

```sh
cd <root dir>
mkdir scripts
cd scripts/
wget https://raw.githubusercontent.com/shimo-react-native/react-native/0.57.5/scripts/ios-configure-glog.sh
```

Podfile

```
# React Native
pod 'React', :git => 'https://github.com/shimo-react-native/java-script-core-ios.git', :tag => 'v0.0.1', :subspecs => [
    'Core',
    'CxxBridge', # Include this for RN >= 0.47
    'DevSupport', # Include this to enable In-App Devmenu if RN >= 0.43
    'RCTNetwork',
    'RCTWebSocket', # Needed for debugging
]

# Third party deps podspec link
pod 'DoubleConversion', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/v0.0.1/third-party-podspecs/DoubleConversion.podspec'
pod 'glog', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/v0.0.1/third-party-podspecs/glog.podspec'
pod 'Folly', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/v0.0.1/third-party-podspecs/Folly.podspec'
```
