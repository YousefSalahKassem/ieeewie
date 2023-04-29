import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/state/global_state.dart';
import 'package:ieeewie/features/Auth/model/user.dart';

import 'package:ieeewie/features/auth/data/remote/interfaces/i_auth_service.dart';

class ProfileNotifier extends StateNotifier<GlobalStates<UserModel>> {
  final IAuthService _authService;
  static final provider =
  StateNotifierProvider.autoDispose<ProfileNotifier, GlobalStates<UserModel>>(
        (ref) =>
        ProfileNotifier(
          ref.watch(IAuthService.provider),
        ),
  );

  ProfileNotifier(this._authService) : super(GlobalStates.initial()) {
    if(FirebaseAuth.instance.currentUser!=null){
      getCurrentUser();
    }
  }

  Future<void> getCurrentUser() async {
    final user = await _authService.getCurrentUserData();
    state = GlobalStates.success(user);
  }

}
