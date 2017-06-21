
Pod::Spec.new do |s|
  s.name             = 'YMADProj'
  s.version          = '0.0.7'
  s.summary      = "YMAD is a SDK for UM AD "


  s.description  = <<-DESC
    封装有米iOS的广告SDK到pod，使集成更方便。
  DESC

  s.homepage     = "https://github.com/lichanghong/YMAD.git"
  s.license      = "MIT"
  s.author             = { "李长鸿" => "lichanghong@b.360.cn" }

  s.source         = { :git => "https://github.com/lichanghong/YMAD.git", :tag => "#{s.version}" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'

  s.source_files = 'YMADProj/Classes/**/*','YMADProj/lib/include'
  s.resource       = "YMADProj/lib/UMVideo.bundle"
  s.preserve_paths = "YMADProj/lib/libUMVideoSDK.a"

  # s.resource_bundles = {
  #   'YMADProj' => ['YMADProj/Assets/*.png']
  # }

  s.frameworks = "SystemConfiguration", "CFNetwork","MediaPlayer","StoreKit","CoreMotion","AudioToolbox","AdSupport","CoreTelephony","Security","WebKit"

  s.library = 'z','sqlite3','icucore'

  s.requires_arc = true

  # s.dependency 'AFNetworking', '~> 2.3'
end
