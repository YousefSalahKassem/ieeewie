import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/state/global_state.dart';
import 'package:ieeewie/features/Auth/model/user.dart';

import 'package:ieeewie/features/auth/data/remote/interfaces/i_auth_service.dart';

class AuthProvider extends StateNotifier<GlobalStates<bool>> {
  final IAuthService _authService;
  static final provider =
      StateNotifierProvider<AuthProvider, GlobalStates<bool>>(
    (ref) => AuthProvider(
      ref.watch(IAuthService.provider),
    ),
  );

  AuthProvider(this._authService) : super(GlobalStates.initial());

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final GlobalKey<FormState> registerFormKey = GlobalKey();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

  Future<void> login(UserModel user) async {
    state = GlobalStates.loading();

    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      final isLoggedIn = await _authService.login(user.email, user.password);
      if (isLoggedIn) {
        state = GlobalStates.success(true);
      }
    }
  }

  Future<void> register(UserModel user) async {
    state = GlobalStates.loading();

    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      final isRegistered = await _authService.register(user);
      if (isRegistered) {
        state = GlobalStates.success(true);
      }
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<void> loginWithGoogle() async {
    state = GlobalStates.loading();
    final isLoggedIn = await _authService.loginWithGoogle();
    if (isLoggedIn) {
      state = GlobalStates.success(true);
    }
  }

  Future<bool> checkIfLoggedIn() async {
    return _authService.checkIfAuth();
  }

  Future<void> deleteAccount() async {
    await _authService.deleteAccount();
  }

  Future<bool> resetPassword(String email) async {
    if (resetPasswordFormKey.currentState!.validate()) {
      resetPasswordFormKey.currentState!.save();
      return _authService.resetPassword(email);
    }
    return false;
  }


}
