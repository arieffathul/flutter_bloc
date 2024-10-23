import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthEventLogin>((event, emit) async {
      // Ketika login dijalankan, loading state emit
      emit(AuthStateLoading());
      // Data menuju backend
      await Future.delayed(const Duration(seconds: 5), () {});
      bool isSuccess = _validateLogin(event.email, event.password);
      if (isSuccess) {
        emit(AuthStateLoaded()); // Sukses login
      } else {
        // Ketika data error atau login gagal
        emit(AuthStateError(message: 'Invalid email or password.'));
      }
    });
  }

  bool _validateLogin(String email, String password) {
    if (email == 'alan@gmail.com' && password == 'saya ganteng') {
      return true;
    } else {
      return false;
    }
  }
}
