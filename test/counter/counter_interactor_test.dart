import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viper/features/counter/interactor/counter_interactor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('CounterInteractor', () {
    for (final testData in _TestDataMaker.make()) {
      test(testData.title, () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final input = container.read(counterInteractorInputProvider);
        for (var i = 0; i < testData.taps; i++) {
          input.updateCount();
        }
        expect(
          container.read(counterInteractorOutputProvider).value,
          testData.expected,
        );
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
  final int expected;
}

final class _TestDataMaker {
  static List<_TestData> make() => const [
    _TestData(title: 'Initial Value is 0', taps: 0, expected: 0),
    _TestData(title: 'Value after count up', taps: 100, expected: 100),
  ];
}
