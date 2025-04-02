import 'package:flutter/material.dart';
import 'tasbeh_logic.dart';
import 'tasbeh_ui.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> with SingleTickerProviderStateMixin {
  late TasbehLogic logic;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    logic = TasbehLogic(
      onTasbeehChange: () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementTasbeeh() {
    logic.incrementTasbeeh();
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return TasbehUI(
      tasbeehText: logic.tasbeehText,
      tasbeehCount: logic.tasbeehCount,
      rotationAngle: logic.rotationAngle,
      controller: _controller,
      onTap: incrementTasbeeh,
    );
  }
}
