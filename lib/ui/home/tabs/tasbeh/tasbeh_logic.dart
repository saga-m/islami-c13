import 'dart:math';

class TasbehLogic {
  int tasbeehCount = 0;
  String tasbeehText = "سبحان الله";
  double rotationAngle = 0;

  final Function onTasbeehChange;

  TasbehLogic({required this.onTasbeehChange});

  void incrementTasbeeh() {
    tasbeehCount++;

    if (tasbeehCount == 33) {
      tasbeehCount = 0;
      if (tasbeehText == "سبحان الله") {
        tasbeehText = "الحمد لله";
      } else if (tasbeehText == "الحمد لله") {
        tasbeehText = "الله أكبر";
      } else if (tasbeehText == "الله أكبر") {
        tasbeehText = "سبحان الله";
      }
    }

    rotationAngle += pi / 2;
    onTasbeehChange();
  }
}
