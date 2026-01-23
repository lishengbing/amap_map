#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint amap_map.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'amap_map'
  s.version          = '1.1.0'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin for AMap.
                       DESC
  s.homepage         = 'https://github.com/lishengbing/amap_map'
  s.license          = { :type => 'Apache License, Version 2.0', :file => '../LICENSE' }
  s.author           = { 'lishengbing' => '1269113083@qq.com' }
  s.source           = { :git => 'git@github.com:lishengbing/amap_map.git', :tag => 'v1.0.8' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AMap3DMap'
  s.static_framework = true
  s.platform = :ios, '12.0'

  # 👇 核心修复1：显式声明所有需要的Amap SDK依赖（包括Search、Location），并指定版本
  s.dependency 'AMap3DMap', '10.0.900'    # 和你本地用的版本一致
  s.dependency 'AMapSearch', '9.7.2'      # 对应amap_flutter_search需要的Search SDK
  s.dependency 'AMapLocation', '2.10.0'   # 对应amap_flutter_location需要的Location SDK

  s.static_framework = true
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386', 
    # 强制Xcode去Pod缓存目录找Amap的头文件和框架
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/AMap3DMap/**" "${PODS_ROOT}/AMapSearch/**" "${PODS_ROOT}/AMapLocation/**"',
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/AMap3DMap/**" "${PODS_ROOT}/AMapSearch/**" "${PODS_ROOT}/AMapLocation/**"'
  }
end
