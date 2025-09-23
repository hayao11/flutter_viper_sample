import 'entity/counter_value.dart';

abstract class CounterViewOutput {
  void didTapIncrement();
}

abstract class CounterInteractorInput {
  void updateCount();
}

abstract class CounterInteractorOutput {
  CounterValue get counterValue;
}
