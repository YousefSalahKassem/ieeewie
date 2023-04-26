import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:ieeewie/features/auth/data/remote/services/auth_service.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements FirebaseAuth {

}

void main() {
  final MockAuth mockFirebaseAuth = MockAuth();
  final AuthService auth = AuthService(mockFirebaseAuth);

  setUp(() {});
  tearDown(() {});

  test("create account", () async {
    final result = await auth.register(
        UserModel(email: "michał12@mail.com", password: "123456789"),);

    expect(result, Matcher);
  });
}
