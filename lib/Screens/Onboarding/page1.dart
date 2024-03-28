import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/page1_image.jpg', // Path to your first background image
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/page1_footer.png', // Path to your first background image
            fit: BoxFit.cover,
          ),
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
              colors: [Colors.black87.withOpacity(1), Colors.transparent],
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
