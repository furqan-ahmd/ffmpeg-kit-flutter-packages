Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.0'
  s.summary          = 'Self-hosted FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands with locally built frameworks.'
  s.homepage         = 'https://github.com/yourusername/ffmpeg-kit-flutter-packages'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Community' => 'community@example.com' }

  s.platform            = :osx
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency          'FlutterMacOS'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.osx.deployment_target = '10.15'

  # Use locally built frameworks
  framework_path = File.join(File.dirname(__FILE__), '../../macos')
  
  s.vendored_frameworks = [
    "#{framework_path}/ffmpegkit.framework",
    "#{framework_path}/libavcodec.framework", 
    "#{framework_path}/libavdevice.framework",
    "#{framework_path}/libavfilter.framework",
    "#{framework_path}/libavformat.framework",
    "#{framework_path}/libavutil.framework",
    "#{framework_path}/libswresample.framework",
    "#{framework_path}/libswscale.framework"
  ]

end