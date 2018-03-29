Pod::Spec.new do |spec|
spec.name         = "KSVSShortVideoCore_iOS"
spec.summary      = "金山云iOS平台短视频解决方案"
spec.version      = "1.2.0"
spec.license      = "Copyright 2016 kingsoft Ltd. All rights reserved"
spec.source       = { :git => "https://github.com/ksvc/KSVSShortVideoCore_iOS.git", :tag => "v#{spec.version}"}
spec.homepage     = "https://github.com/ksvc/KSVSShortVideoCore_iOS"
spec.author       = { "ksyun" => "ksyun.com"  }
spec.platform     = :ios, '8.0'

spec.vendored_frameworks = "KSVSSdkApiDemo/KSVSSdkCore.framework"

spec.dependency 'KSYMediaEditorKit','2.2.3'
spec.dependency 'Ks3SDK','1.7.2'
spec.dependency 'FMDB'
spec.dependency 'UICKeyChainStore'
spec.dependency 'YYKit'
spec.dependency 'AFNetworking'
spec.dependency 'FMDB'
end
