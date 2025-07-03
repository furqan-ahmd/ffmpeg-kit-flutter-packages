# FFmpegKit Flutter Packages

🎬 **Ready-to-use FFmpegKit packages for Flutter** - No build required!

Since FFmpegKit has been retired and packages will be removed from repositories, this repository provides pre-built packages for continued Flutter development.

## 🚀 Quick Start

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ffmpeg_kit_flutter:
    git:
      url: https://github.com/yourusername/ffmpeg-kit-flutter-packages.git
      path: flutter/
```

Then run:
```bash
flutter pub get
```

## 📱 Platform Support

✅ **iOS** - Frameworks included  
✅ **Android** - AAR included  
✅ **macOS** - Frameworks included  

## 🎯 What's Included

- **Minimal Build**: Core FFmpeg functionality with system libraries
- **All Architectures**: 
  - iOS: arm64, arm64e, x86-64 (simulator)
  - Android: arm-v7a, arm-v7a-neon, arm64-v8a, x86, x86-64
  - macOS: arm64, x86-64

## 📋 System Libraries Enabled

### iOS
- AudioToolbox, AVFoundation, VideoToolbox
- zlib, libiconv, bzip2

### Android  
- zlib, MediaCodec

### macOS
- AudioToolbox, AVFoundation, VideoToolbox
- CoreImage, OpenCL, OpenGL
- zlib, libiconv, bzip2

## 💻 Usage Example

```dart
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

// Execute FFmpeg command
FFmpegKit.execute('-i input.mp4 -c:v mpeg4 output.mp4').then((session) async {
  final returnCode = await session.getReturnCode();
  
  if (ReturnCode.isSuccess(returnCode)) {
    print('✅ Video conversion successful!');
  } else {
    print('❌ Video conversion failed');
  }
});

// Get media information
FFprobeKit.getMediaInformation('video.mp4').then((session) async {
  final information = await session.getMediaInformation();
  if (information != null) {
    print('Duration: ${information.getDuration()}');
    print('Bitrate: ${information.getBitrate()}');
  }
});
```

## 🔧 Build Information

- **Built on**: macOS with Xcode
- **FFmpeg Version**: 6.0
- **License**: LGPL v3.0
- **Build Date**: $(date)

## 📚 Documentation

For complete API documentation, see the [original FFmpegKit documentation](https://github.com/arthenica/ffmpeg-kit/wiki).

## ⚠️ Important Notes

1. **Project Status**: This is a community-maintained package since FFmpegKit has been retired
2. **Minimal Build**: Only essential libraries included for maximum compatibility
3. **Self-Hosted**: You control the dependency, no external package removal concerns

## 🤝 Contributing

If you need additional libraries or find issues:
1. Fork this repository
2. Rebuild with additional libraries using the original FFmpegKit build scripts
3. Submit a pull request

## 📄 License

Inherits FFmpegKit's LGPL v3.0 license. See LICENSE file for details.

---

🎉 **Ready to use!** No complex setup required - just add the dependency and start coding!