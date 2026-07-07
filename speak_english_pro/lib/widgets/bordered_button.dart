import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled;

  const BorderedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: filled
          ? FilledButton(onPressed: onPressed, child: Text(text))
          : OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
