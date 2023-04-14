part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterValueChanged extends CounterState {
 final int counter;
  CounterValueChanged(this.counter);
}
