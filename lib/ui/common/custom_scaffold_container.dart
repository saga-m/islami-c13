import 'package:flutter/material.dart';

import '../assets.dart';

class CustomScaffoldContainer extends StatelessWidget {
  String backgroundImage;
  Widget child;

  CustomScaffoldContainer(
      {required this.child, this.backgroundImage = AppImages.homeBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundImage), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
