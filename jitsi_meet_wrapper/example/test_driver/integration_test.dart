import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  await Process.run('adb', [
    'shell',
    'pm',
    'grant',
    'dev.saibotma.jitsi_meet_wrapper_example',
    'android.permission.CAMERA'
  ]);
  await Process.run('adb', [
    'shell',
    'pm',
    'grant',
    'dev.saibotma.jitsi_meet_wrapper_example',
    'android.permission.CAMERA'
  ]);

  await integrationDriver(
    onScreenshot: (screenshotName, screenshotBytes) async {
      final image = await File('test_results/$screenshotName.png').create(
        // Create the folder "test_results" if it doesn't exist.
        recursive: true,
      );

      image.writeAsBytesSync(screenshotBytes);

      // Return false if the screenshot is invalid.
      return true;
    },
  );
}
