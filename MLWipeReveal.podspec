Pod::Spec.new do |spec|
  spec.name         = 'MLWipeReveal'
  spec.version      = '1.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/nomoneynohoney/MLWipeReveal.git'
  spec.authors      = { 'Marc Liu' => 'sorrystyle@gapp.nthu.edu.tw' }
  spec.summary      = 'A NSLog replacement for showing log window on device.'
  spec.source       = { :git => 'https://github.com/nomoneynohoney/MLWipeReveal.git', :tag => '1.1.0' }
  spec.module_name  = 'MLWipeReveal'

  spec.ios.deployment_target  = '8.0'

  spec.source_files       = 'MLWipeReveal/*.{h,m}'
  spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'UIKit'
end
