import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_panda_clone/features/authentication/authServices.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    on<AuthInitialEvent>(authInitialEvent);
  }

  FutureOr<void> authInitialEvent(
      AuthInitialEvent event, Emitter<AuthState> emit) async {
    emit.call(AuthLoadingState());
    AuthService authService = AuthService();
    Record userRecord = (emailController.text, passwordController.text);
    User? user;
    try {
      user = await authService.createUser(userRecord as (String, String));
      if (user != null) {
        emit(AuthLoadedState(msg: 'Successfuly Sign Up'));
      } else {
        emit(AuthErrorState(errorMsg: 'User not found'));
      }
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
