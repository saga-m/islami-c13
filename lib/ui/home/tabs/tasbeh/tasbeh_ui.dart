import 'package:flutter/material.dart';

class TasbehUI extends StatelessWidget {
  final String tasbeehText;
  final int tasbeehCount;
  final double rotationAngle;
  final AnimationController controller;
  final VoidCallback onTap;

  const TasbehUI({
    super.key,
    required this.tasbeehText,
    required this.tasbeehCount,
    required this.rotationAngle,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: rotationAngle * controller.value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "assets/images/sebha.png",
                    height: 300,
                    width: 300,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tasbeehText,
                      style:  TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$tasbeehCount',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
