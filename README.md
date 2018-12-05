# java-script-core-ios

based on [react-native#v0.57.5](https://github.com/facebook/react-native/tree/v0.57.5)

## Usage

Podfile

```
# React Native
pod 'React', :git => 'https://github.com/shimo-react-native/java-script-core-ios.git', :subspecs => [
    'Core',
    'CxxBridge', # Include this for RN >= 0.47
    'DevSupport', # Include this to enable In-App Devmenu if RN >= 0.43
    'RCTNetwork',
    'RCTWebSocket', # Needed for debugging
]

# Third party deps podspec link
pod 'DoubleConversion', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/master/third-party-podspecs/DoubleConversion.podspec'
pod 'glog', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/master/third-party-podspecs/glog.podspec'
pod 'Folly', :podspec => 'https://raw.githubusercontent.com/shimo-react-native/java-script-core-ios/master/third-party-podspecs/Folly.podspec'
```
