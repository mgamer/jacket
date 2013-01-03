Pod::Spec.new do |s|
  s.name         = "HLDeferred-objc"
  s.version      = "0.1"
  s.summary      = "Deferred for iOS, based on Twisted."
  s.homepage     = "https://github.com/mgamer/HLDeferred-objc"
  s.license      = 'MIT'
  s.author       = { "HeavyLifters Network Ltd." => "heavylifters" } 
  s.source       = { :git => "https://github.com/mgamer/HLDeferred-objc.git", :commit => "6f5ead1f72867eecacc35862f90d249f0100d0e1" }
  s.platform     = :ios  
  s.source_files = 'HLDeferred/Classes/HL*.{h,m}'
  s.dependency 'JSONKit', '~> 1.4'
end
