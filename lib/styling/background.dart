import 'package:flutter/material.dart';

class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;

  const BackgroundImageFb1({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
