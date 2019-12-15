Pod::Spec.new do |s|
  s.name = 'PadView'
  s.version = '1.1'
  s.summary = 'PadView is a bottom pad view controller'
  s.description = <<-DESC
  PadView written on Swift 5.0 by levantAJ
                       DESC
  s.homepage = 'https://github.com/levantAJ/PadView'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Tai Le' => 'sirlevantai@gmail.com' }
  s.source = { :git => 'https://github.com/levantAJ/PadView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'PadView/*.{swift}'

end