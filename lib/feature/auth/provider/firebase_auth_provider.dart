import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/index.dart';
import 'auth_provider.dart' as auth;

class FirebaseAuthProvider extends auth.AuthProvider with ProviderLoggy {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();

  @override
  Stream<String?> getUserIdStream() {
    return _auth.authStateChanges().map((user) => user?.uid);
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
    await _googleAuth.signOut();
  }

  @override
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!.uid;
    } catch (e, s) {
      loggy.error('signInWithEmailAndPassword error', e, s);
      rethrow;
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!.uid;
    } catch (e, s) {
      loggy.error('signUpWithEmailAndPassword error', e, s);
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e, s) {
      loggy.error('resetPassword error', e, s);
      rethrow;
    }
  }

  @override
  Future<String?> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await _googleAuth.signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null) {
      return null;
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user!.uid;
  }
}
