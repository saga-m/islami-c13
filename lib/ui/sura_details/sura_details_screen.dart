import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/sura_details/verse_widget.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura-details";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int suraIndex = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraContent(suraIndex);
    }
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        title: Text(QuranResources.englishQuranSurahs[suraIndex]),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.suraTitleBadgeLeft,
              ),
              Text(
                QuranResources.arabicQuranSuras[suraIndex],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Image.asset(
                AppImages.suraTitleBadgeRight,
              )
            ],
          ),
          Expanded(
              child: verses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return VerseWidget(verses[index], index);
                      },
                      separatorBuilder: (context, index) => Container(
                            color: Theme.of(context).primaryColor,
                            width: double.infinity,
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 64),
                          ),
                      itemCount: verses.length))
        ],
      ),
    );
  }

  void loadSuraContent(int suraIndex) async {
    var fileName = "assets/files/${suraIndex + 1}.txt";
    var fileContent = await rootBundle.loadString(fileName);
    var ayas = fileContent.split("\n");
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      verses.addAll(ayas);
    });
  }
}
