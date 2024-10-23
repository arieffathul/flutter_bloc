import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 2);
  void multiple() => emit(state * 3);
  void divide() => emit(state ~/ 4);
}
