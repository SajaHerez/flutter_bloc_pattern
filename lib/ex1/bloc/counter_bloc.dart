import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncreamentEvent) {
        counter++;
        emit(CounterValueChanged(counter));
      } else if (event is DecreamentEvent) {
        counter--;
        emit(CounterValueChanged(counter));
      } else if (event is ResetEvent) {
        counter = 0;
        emit(CounterValueChanged(counter));
      }
    });
  }
}
