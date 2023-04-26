import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:ieeewie/features/auth/data/remote/services/auth_service.dart';

abstract class IAuthService {
  static final provider = Provider<AuthService>((ref) => AuthService(FirebaseAuth.instance));

  Future<bool> register(UserModel user);

  Future<bool> login(String email, String password);

  Future<bool> loginWithGoogle();

  Future<void> signOut();

  Future<bool> checkIfAuth();

  Future<String> getUserId();

  Future<bool> deleteAccount();

  Future<void> sendUserData(UserModel user);

  Future<bool> hasRegisterBefore();

  Future<void> deleteUserData();

  Future<bool> resetPassword(String email);

  Future<UserModel> getCurrentUserData();

  Future<bool> updateProfile(UserModel user);
}
