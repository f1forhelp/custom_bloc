import 'package:flutter_custom_bloc/flutter_custom_bloc.dart';
import 'package:example/counter_example/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterState> {
  CounterBloc() : super(CounterState(countValue: 2));

  void increment() {
    emit(state.copyWith(countValue: state.countValue + 1));
  }

  void decrement() {
    emit(state.copyWith(countValue: state.countValue - 1));
  }
}
