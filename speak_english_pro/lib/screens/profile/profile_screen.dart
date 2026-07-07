import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const CircleAvatar(radius: 42, child: Icon(Icons.person_rounded, size: 42)),
            const SizedBox(height: 12),
            Text(user?.phoneNumber ?? 'Guest', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            const Text('Learning streak, certificates, progress, and settings appear here.'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
