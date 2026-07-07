import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneCtrl = TextEditingController(text: '+91');
  final _otpCtrl = TextEditingController();
  bool _otpSent = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _otpCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    final auth = context.read<AuthProvider>();
    await auth.sendOtp(_phoneCtrl.text.trim());
    if (auth.verificationId != null && mounted) {
      setState(() => _otpSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent successfully')),
      );
    }
  }

  Future<void> _verifyOtp() async {
    final auth = context.read<AuthProvider>();
    await auth.verifyOtp(_otpCtrl.text.trim());
    if (FirebaseAuth.instance.currentUser != null && mounted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else if (auth.errorMessage != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(auth.errorMessage!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(Icons.lock_rounded, size: 72, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text('Mobile OTP Login', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 28),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                hintText: '+91XXXXXXXXXX',
              ),
            ),
            const SizedBox(height: 16),
            if (_otpSent)
              TextField(
                controller: _otpCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  hintText: 'Enter received OTP',
                ),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: auth.isLoading ? null : (_otpSent ? _verifyOtp : _sendOtp),
                child: auth.isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : Text(_otpSent ? 'Verify OTP' : 'Send OTP'),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Firebase phone authentication must be configured in Firebase Console.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
