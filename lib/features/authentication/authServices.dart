import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static AuthService? _authService;
  AuthService._internal();
  factory AuthService() {
    return _authService ??= AuthService._internal();
  }

  FirebaseAuth get getFireBaseAuth => FirebaseAuth.instance;

  Future<User?> createUser((String email, String password) user) async {
    UserCredential userCredential = await getFireBaseAuth
        .createUserWithEmailAndPassword(email: user.$1, password: user.$2);
    return userCredential.user;
  }
}
