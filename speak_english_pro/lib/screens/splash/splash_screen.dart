import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(milliseconds: 1600));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(
      StorageService.onboardingSeen ? AppRoutes.login : AppRoutes.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.record_voice_over_rounded, size: 92, color: theme.colorScheme.primary),
            const SizedBox(height: 20),
            Text('Speak English', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('Marathi + English learning app', style: theme.textTheme.bodyLarge),
            const SizedBox(height: 30),
            const SizedBox(width: 28, height: 28, child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
