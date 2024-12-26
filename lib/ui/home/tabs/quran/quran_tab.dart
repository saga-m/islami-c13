import 'package:flutter/material.dart';
import 'package:islami_c13/ui/common/shared_preferences_utils.dart';
import 'package:islami_c13/ui/home/tabs/quran/most_recent_card.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/home/tabs/quran/sura_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> mostRecentList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getSavedMostRecentData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search by name",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))),
          ),
        ),
        Visibility(
          visible: mostRecentList.isNotEmpty,
          child: Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecentCard(mostRecentList[index]);
              },
              itemCount: mostRecentList.length,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: QuranResources.arabicQuranSuras.length,
            itemBuilder: (context, index) {
              return SuraWidget(index);
            },
            separatorBuilder: (context, index) => Container(
              color: Colors.white,
              height: 1,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 64),
            ),
          ),
        )
      ],
    );
  }

  void getSavedMostRecentData() async {
    var indicesList = await readMostRecentIndices();
    var isDifferent = false;
    if (indicesList.length != mostRecentList.length) {
      isDifferent = true;
    } else if (indicesList.isNotEmpty &&
        (indicesList.firstOrNull != mostRecentList.firstOrNull)) {
      isDifferent = true;
    }

    if (!isDifferent) {
      return;
    }
    print("updating most recent");
    setState(() {
      this.mostRecentList = indicesList;
    });
  }
}
