Pod::Spec.new do |s|
  s.name             = 'pow_plugin'
  s.version          = '0.0.1'
  s.summary          = 'Proof of work plugin'
  s.description      = <<-DESC
A proof of work plugin for Flutter.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  s.vendored_frameworks = 'Frameworks/pow_lib.framework'
  s.static_framework = true
end