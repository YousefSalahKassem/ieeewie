import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ieeewie/features/auth/data/remote/services/auth_service.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}


void main() {
  late AuthService authService;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authService = AuthService(mockFirebaseAuth);
  });

  group('checkIfAuth', () {
    test('returns true if user is logged in', () async {
      final mockUser = MockFirebaseUser();
      when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
      final result = await authService.checkIfAuth();
      expect(result, true);
    });

    test('returns false if user is not logged in', () async {
      when(mockFirebaseAuth.currentUser).thenReturn(null);
      final result = await authService.checkIfAuth();
      expect(result, false);
    });
  });
}
