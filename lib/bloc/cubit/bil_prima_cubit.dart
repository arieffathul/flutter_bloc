import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'bil_prima_state.dart';

class BilPrimaCubit extends Cubit<int> {
  BilPrimaCubit() : super(0);

  bool _isPrime(int number) {
    if (number <= 1) {
      return false;
    } // Bilangan <= 1 bukan prima
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false; // Jika habis dibagi angka lain, bukan prima
      }
    }
    return true;
  }

  void check(int number) {
    if (_isPrime(number)) {
      emit(1);
    } else {
      emit(0);
    }
    print(state);
  }
}
