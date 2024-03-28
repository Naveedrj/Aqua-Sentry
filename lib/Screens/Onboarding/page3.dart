import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/page3_image.jpg', // Path to your first background image
          fit: BoxFit.cover,
        ),
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset(
        //     'assets/images/overlay.jpg', // Path to your first background image
        //     fit: BoxFit.cover,
        //   ),
        // ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.9), Colors.transparent],
              stops: [0, 1],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Container(color: Colors.black), // Adjust the color if needed
        ),
      ],
    );
  }
}
