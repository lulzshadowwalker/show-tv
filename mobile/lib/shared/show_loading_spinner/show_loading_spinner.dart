import 'package:flutter/material.dart';

class ShowLoadingSpinner extends StatelessWidget {
  const ShowLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: const CircularProgressIndicator(color: Colors.white),
    );
  }
}
