#IKTRouter

Pod::Spec.new do |s|
  s.name             = 'IKTBaseKit'
  s.version          = '0.0.2'
  s.summary          = '组件库'

  s.description      = <<-DESC
  基础组件库 for iOS
                       DESC

  s.homepage         = 'https://github.com/IKTSmart/IKTBaseKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { 'IKT' => 'E.T.Scorpion' }
  s.source           = { :git => 'https://github.com/IKTSmart/IKTBaseKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IKTBaseKit/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'Router' => ['IKTBaseKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
