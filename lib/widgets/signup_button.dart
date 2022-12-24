import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SignupButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: onTap,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }
}
