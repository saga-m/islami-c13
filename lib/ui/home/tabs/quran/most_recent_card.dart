import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';

class MostRecentCard extends StatelessWidget {
  int index;

  MostRecentCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryGold,
      child: Container(
        width: 283,
        padding: EdgeInsets.all(12),
        child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            AppImages.mostRecentImage,
            alignment: Alignment.centerRight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QuranResources.englishQuranSurahs[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black)),
              Text(QuranResources.arabicQuranSuras[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black)),
              Text("${QuranResources.versesNumbers[index]} Verses",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black)),
            ],
          )
        ]),
      ),
    );
  }
}
