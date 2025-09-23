import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viper/features/counter/presenter/counter_presenter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('CounterPresenter', () {
    for (final testData in _TestDataMaker.make()) {
      test(testData.title, () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final presenter = container.read(counterViewOutputProvider);
        for (var i = 0; i < testData.tapCount; i++) {
          presenter.didTapIncrement();
        }

        expect(
          container.read(counterViewDataProvider).count,
          testData.expectedText,
        );
      });
    }
  });
}

final class _TestData {
  const _TestData({
    required this.title,
    required this.tapCount,
    required this.expectedText,
  });

  final String title;
  final int tapCount;
  final String expectedText;
}

final class _TestDataMaker {
  static List<_TestData> make() => const [
    _TestData(title: 'Initial display is 0', tapCount: 0, expectedText: '0'),
    _TestData(
      title: 'Display is 10 after pressing button 10 times',
      tapCount: 10,
      expectedText: '10',
    ),
  ];
}
