import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viper/features/counter/view/counter_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('CounterPage integration', () {
    for (final testData in _TestDataMaker.make()) {
      testWidgets(testData.title, (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: CounterView(title: 'Counter')),
          ),
        );

        // Tap the specified number of times
        for (var i = 0; i < testData.taps; i++) {
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pump();
        }

        // Verify that the expected string is displayed
        expect(find.text(testData.expected), findsOneWidget);
      });
    }
  });
}

final class _TestData {
  const _TestData({
    required this.title,
    required this.taps,
    required this.expected,
  });

  final String title;
  final int taps;
  final String expected;
}

final class _TestDataMaker {
  static List<_TestData> make() => const [
    _TestData(title: 'Initial display is 0', taps: 0, expected: '0'),
    _TestData(
      title: 'Display is 1 after pressing button once',
      taps: 1,
      expected: '1',
    ),
  ];
}
