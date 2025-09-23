import 'package:flutter_viper/features/counter/counter_contract.dart';
import 'package:flutter_viper/features/counter/interactor/counter_interactor.dart';
import 'package:flutter_viper/features/counter/view/view_data/counter_view_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_presenter.g.dart';

final counterViewOutputProvider = AutoDisposeProvider<CounterViewOutput>((ref) {
  return ref.watch(_counterPresenterProvider.notifier);
});

final counterViewDataProvider = AutoDisposeProvider<CounterViewData>((ref) {
  return ref.watch(_counterPresenterProvider);
});

@riverpod
final class _CounterPresenter extends _$CounterPresenter
    implements CounterViewOutput {
  @override
  CounterViewData build() {
    final counterValue = ref.watch(counterInteractorOutputProvider);
    final count = counterValue.value.toString();
    return CounterViewData(count: count);
  }

  @override
  void didTapIncrement() {
    ref.read(counterInteractorInputProvider).updateCount();
  }
}
