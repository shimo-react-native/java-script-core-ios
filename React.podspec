# coding: utf-8

source = { :git => 'https://github.com/facebook/react-native.git' }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1'
folly_version = '2016.10.31.00'

Pod::Spec.new do |s|
  s.name                    = "React"
  s.version                 = "0.0.1"
  s.summary                 = "React Native JavaScriptCore for iOS"
  s.description             = <<-DESC
                                JavaScriptCore iOS runtime from React Native
                             DESC
  s.homepage                = "http://facebook.github.io/react-native/"
  s.author                  = "Facebook"
  s.source                  = source
  s.default_subspec         = "Core"
  s.requires_arc            = true
  s.platforms               = { :ios => "9.0" }
  s.pod_target_xcconfig     = { "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }
  s.preserve_paths          = "LICENSE", "LICENSE-docs"
  s.cocoapods_version       = ">= 1.2.0"

  s.subspec "Core" do |ss|

    ss.source_files         = "React/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files        = "**/__tests__/*",
                              "React/DevSupport/*",
                              "React/Inspector/*",
                              "React/Cxx*/*"
    ss.header_dir           = "React"
    ss.framework            = "JavaScriptCore"
    ss.libraries            = "stdc++"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "CxxBridge" do |ss|
    ss.dependency             "Folly", folly_version
    ss.dependency             "React/Core"
    ss.dependency             "React/cxxreact"
    ss.compiler_flags       = folly_compiler_flags
    ss.private_header_files = "React/Cxx*/*.h"
    ss.source_files         = "React/Cxx*/*.{h,m,mm}"
  end

  s.subspec "DevSupport" do |ss|
    ss.dependency             "React/Core"
    ss.dependency             "React/RCTWebSocket"
    ss.source_files         = "React/DevSupport/*",
                              "React/Inspector/*"
  end

  s.subspec "jschelpers" do |ss|
    ss.dependency             "Folly", folly_version
    ss.dependency             "React/PrivateDatabase"
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "ReactCommon/jschelpers/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/jschelpers/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
    ss.framework            = "JavaScriptCore"
  end

  s.subspec "jsinspector" do |ss|
    ss.source_files         = "ReactCommon/jsinspector/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/jsinspector/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "PrivateDatabase" do |ss|
    ss.source_files         = "ReactCommon/privatedata/*.{cpp,h}"
    ss.private_header_files = "ReactCommon/privatedata/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "cxxreact" do |ss|
    ss.dependency             "React/jschelpers"
    ss.dependency             "React/jsinspector"
    ss.dependency             "boost-for-react-native", "1.63.0"
    ss.dependency             "Folly", folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "ReactCommon/cxxreact/*.{cpp,h}"
    ss.exclude_files        = "ReactCommon/cxxreact/SampleCxxModule.*"
    ss.private_header_files = "ReactCommon/cxxreact/*.h"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "RCTBlob" do |ss|
    ss.dependency             "React/Core"
    ss.source_files         = "Libraries/Blob/*.{h,m,mm}"
    ss.preserve_paths       = "Libraries/Blob/*.js"
  end

  s.subspec "RCTNetwork" do |ss|
    ss.dependency             "React/Core"
    ss.source_files         = "Libraries/Network/*.{h,m,mm}"
  end

  s.subspec "RCTWebSocket" do |ss|
    ss.dependency             "React/Core"
    ss.dependency             "React/RCTBlob"
    ss.dependency             "React/fishhook"
    ss.source_files         = "Libraries/WebSocket/*.{h,m}"
  end

  s.subspec "fishhook" do |ss|
    ss.header_dir           = "fishhook"
    ss.source_files         = "Libraries/fishhook/*.{h,c}"
  end
end
