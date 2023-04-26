import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ieeewie/core/helpers/firebase_exceptions.dart';
import 'package:ieeewie/core/helpers/ui_helpers.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:ieeewie/features/auth/data/remote/constants/paths.dart';
import 'package:ieeewie/features/auth/data/remote/interfaces/i_auth_service.dart';

class AuthService implements IAuthService {
  final FirebaseAuth auth;
  AuthService(this.auth);

  @override
  Future<bool> checkIfAuth() async {
    return auth.currentUser != null;
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      UiAlerts.showSuccessNotification("Login Successfully");
      return true;
    } on FirebaseAuthException catch (message) {
      FirebaseExceptions.handleAuthException(message);
      return false;
    }
  }

  @override
  Future<bool> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await auth.signInWithCredential(credential);
      final isRegisterBefore = await hasRegisterBefore();
      if (!isRegisterBefore) {
        sendUserData(
          UserModel(
            email: googleUser.email,
            password: "",
            photoUrl: googleUser.photoUrl ?? "",
            name: googleUser.displayName ?? "",
          ),
        );
      }
      UiAlerts.showSuccessNotification("Login Successfully");

      return true;
    } on FirebaseAuthException catch (message) {
      FirebaseExceptions.handleAuthException(message);
      return false;
    }
  }

  @override
  Future<bool> register(UserModel user) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await sendUserData(user);
      UiAlerts.showSuccessNotification("Register Successfully");

      return true;
    } on FirebaseAuthException catch (message) {
      FirebaseExceptions.handleAuthException(message);
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    final isUserLoggedInFromGoogle = await _checkGoogleLoggedIn();
    if (isUserLoggedInFromGoogle) {
      await GoogleSignIn().disconnect();
    }
    await auth.signOut();
  }

  Future<bool> _checkGoogleLoggedIn() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      final userCredential = await user.getIdTokenResult();
      if (userCredential.signInProvider == "google.com") {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  @override
  Future<String> getUserId() async {
    final userId = auth.currentUser?.uid ?? "";
    return userId;
  }

  @override
  Future<bool> deleteAccount() async {
    try {
      await deleteUserData();
      await auth.currentUser!.delete();
      signOut();
      UiAlerts.showSuccessNotification("Deleted Successfully");

      return true;
    } on FirebaseAuthException catch (message) {
      FirebaseExceptions.handleAuthException(message);
      return false;
    }
  }

  @override
  Future<bool> hasRegisterBefore() async {
    return auth.currentUser!.providerData.any(
      (provider) => provider.providerId == GoogleAuthProvider.PROVIDER_ID,
    );
  }

  @override
  Future<void> sendUserData(UserModel user) async {
    final uid = await getUserId();
    await FirebaseFirestore.instance
        .collection(AuthPaths.users)
        .doc(uid)
        .set(user.toJson());
  }

  @override
  Future<void> deleteUserData() async {
    final uid = await getUserId();
    FirebaseFirestore.instance.collection(AuthPaths.users).doc(uid).delete();
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      UiAlerts.showSuccessNotification("Message sent, Please check your Email");
      return true;
    } on FirebaseAuthException catch (message) {
      FirebaseExceptions.handleAuthException(message);
      return false;
    }
  }

  @override
  Future<UserModel> getCurrentUserData() async {
    final uid = await getUserId();
    final userData = await FirebaseFirestore.instance
        .collection(AuthPaths.users)
        .doc(uid)
        .get();
    final email =
        userData.data()?['email'].toString() ?? auth.currentUser?.email ?? "";
    final phone = userData.data()?['phoneNumber'].toString() ??
        "";
    final name = userData.data()?['name'].toString() ??
        auth.currentUser?.displayName ??
        "";
    final photo = userData.data()?['photoUrl'].toString() ??
        auth.currentUser?.photoURL ??
        "";

    final user = UserModel(
        email: email,
        password: "",
        phoneNumber: phone,
        name: name,
        photoUrl: photo,
    );
    return user;
  }

  @override
  Future<bool> updateProfile(UserModel user) async {
    try {
      final uid = await getUserId();
      final currentUser = auth.currentUser;
      if (currentUser == null) {
        return false;
      }
      await FirebaseFirestore.instance.collection(AuthPaths.users).doc(uid).update(user.toJson());
      await currentUser.updateDisplayName(user.name);
      await currentUser.updatePhotoURL(user.photoUrl);
      UiAlerts.showSuccessNotification("Profile Updated Successfully");
      return true;
    } on FirebaseException catch (e) {
      FirebaseExceptions.handleFirebaseException(e);
      return false;
    }
  }
}
