// import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'ganjil_genap_state.dart';

class GanjilGenapCubit extends Cubit<int> {
  GanjilGenapCubit() : super(0);

  void hitung(int i) {
    print(state);
    print(i);
    emit((state + i) % 2);
    print(state + i);
  }
}
