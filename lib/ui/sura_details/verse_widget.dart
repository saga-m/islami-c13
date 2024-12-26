import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  String verse;
  int index;

  VerseWidget(this.verse, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Text(
        '$verse (${index + 1})',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
