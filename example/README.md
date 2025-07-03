# FFmpegKit Flutter Example

## Quick Test Usage

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ffmpeg_kit_flutter:
    git:
      url: https://github.com/yourusername/ffmpeg-kit-flutter-packages.git
      path: flutter/
```

## Example Code

```dart
import 'package:flutter/material.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FFmpegKit Demo',
      home: FFmpegDemo(),
    );
  }
}

class FFmpegDemo extends StatefulWidget {
  @override
  _FFmpegDemoState createState() => _FFmpegDemoState();
}

class _FFmpegDemoState extends State<FFmpegDemo> {
  String _output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FFmpegKit Demo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _testFFmpeg,
              child: Text('Test FFmpeg'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _testFFprobe,
              child: Text('Test FFprobe'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_output),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _testFFmpeg() async {
    setState(() => _output = 'Running FFmpeg...\n');
    
    await FFmpegKit.execute('-f lavfi -i testsrc2=duration=5:size=320x240:rate=30 test.mp4')
        .then((session) async {
      final returnCode = await session.getReturnCode();
      final output = await session.getOutput();
      
      setState(() {
        _output += 'FFmpeg completed with return code $returnCode\n';
        _output += 'Success: ${ReturnCode.isSuccess(returnCode)}\n';
        _output += 'Output: $output\n\n';
      });
    });
  }

  void _testFFprobe() async {
    setState(() => _output += 'Running FFprobe...\n');
    
    await FFprobeKit.execute('-version').then((session) async {
      final returnCode = await session.getReturnCode();
      final output = await session.getOutput();
      
      setState(() {
        _output += 'FFprobe completed with return code $returnCode\n';
        _output += 'Success: ${ReturnCode.isSuccess(returnCode)}\n';
        _output += 'Output: $output\n\n';
      });
    });
  }
}