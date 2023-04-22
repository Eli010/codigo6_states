//aqui manejaremos nuestro cubic
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterState {}

class CounterInitState extends CounterState {
  final int data = 0;
}

class IncrementState extends CounterState {
  final int data;
  IncrementState(this.data);
}

class DecrementState extends CounterState {
  final int data;
  DecrementState(this.data);
}

class CounterCubit extends Cubit<CounterState> {
  //cubit
  CounterCubit() : super(CounterInitState());
  increment() {
    if (state is CounterInitState) {
      CounterInitState current = state as CounterInitState;
      emit(IncrementState(current.data + 1));
    } else if (state is IncrementState) {
      IncrementState currentState = state as IncrementState;
      emit(IncrementState(currentState.data + 1));
    }
    // IncrementState currentState = state as IncrementState;
    // print(currentState);
    // emit(IncrementState(0));
    // print("increment!!!!!");
    // print(IncrementState(1));
    // print("Increment");
    // print(state);
    // emit(state + 1);
  }

  decrement() {
    print("Decrement");
  }

  restart() {
    print("Restart");
  }
}
