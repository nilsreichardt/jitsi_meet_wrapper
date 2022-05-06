import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jitsi_meet_wrapper_example/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  group('Jitsi Meet Wrapper', () {
    testWidgets('should open the native Jitsi view', (tester) async {
      await tester.pumpWidget(const MyApp());

      // This is required prior to taking the screenshot (Android only).
      await binding.convertFlutterSurfaceToImage();

      // Trigger a frame.
      await tester.pumpAndSettle();
      final bytes = await binding.takeScreenshot('screenshot-1');

      await expectLater(bytes, matchesGoldenFile('goldens/screenshot-1.png'));
    });
  });
}
