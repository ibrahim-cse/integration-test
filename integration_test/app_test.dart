import 'package:expansion_panal/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Full app test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final email = find.byKey(Key('email'));
      final password = find.byKey(Key('password'));
      final login = find.byKey(Key('login'));
      final button1 = find.byKey(Key('button1'));
      final button2 = find.byKey(Key('button2'));
      // final button3 = find.byKey(Key('button3'));
      final backButton = find.byType(IconButton);

      await tester.enterText(email, 'ibrahim@gmail.com');
      await tester.pumpAndSettle();
      await tester.enterText(password, '1234');
      await tester.pumpAndSettle();
      await tester.tap(login);
      await tester.pumpAndSettle();
      await tester.tap(button1);
      await tester.pumpAndSettle();
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      await tester.tap(button2);
      await tester.pumpAndSettle();
      await tester.tap(backButton);
      await tester.pumpAndSettle();
    });
  });
}
