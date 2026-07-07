import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? verificationId;
  String? errorMessage;

  Future<void> sendOtp(String phoneNumber) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _authService.sendOtp(
        phoneNumber: phoneNumber,
        onCodeSent: (id) => verificationId = id,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp(String smsCode) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      if (verificationId == null) {
        throw Exception('Verification ID missing');
      }
      await _authService.verifyOtp(
        verificationId: verificationId!,
        smsCode: smsCode,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> signOut() => _authService.signOut();
}
