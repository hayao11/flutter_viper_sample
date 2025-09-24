import 'package:flutter_viper/features/counter/counter_contract.dart';
import 'package:flutter_viper/features/counter/entity/counter_value.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_interactor.g.dart';

final counterInteractorInputProvider =
    AutoDisposeProvider<CounterInteractorInput>((ref) {
      return ref.watch(_counterInteractorProvider.notifier);
    });

final counterInteractorOutputProvider = AutoDisposeProvider<CounterValue>((
  ref,
) {
  return ref.watch(_counterInteractorProvider);
});

@riverpod
final class _CounterInteractor extends _$CounterInteractor
    implements CounterInteractorInput {
  @override
  CounterValue build() {
    return const CounterValue(0);
  }

  @override
  void updateCount() {
    state = CounterValue(state.value + 1);
  }
}
