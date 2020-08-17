Pod::Spec.new do |s|
  s.name             = 'Qase'
  s.version          = '0.1.1'
  s.summary          = 'Qase'
  s.swift_version    = '5.0'
  
  s.homepage         = 'https://qase.io'
  s.license          = { :type => 'APACHE', :file => 'LICENSE' }
  s.author           = { 'Mikhail Golovko' => 'mihailmvg@gmail.com' }
  s.source           = { :git => 'https://github.com/qase-tms/qase-xcode.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Qase/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Qase' => ['Qase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'XCTest'
  # s.dependency 'AFNetworking', '~> 2.3'
end
