import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/constants.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: const Text("Continue with Google"),
        icon: Image.asset(
          Constants.googlePath,
          width: 40,
        ),
      ),
    );
  }
}
