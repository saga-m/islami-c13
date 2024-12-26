import 'package:flutter/material.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/home/tabs/quran/sura_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filteredSuraIndices = List.generate(
    114,
    (index) {
      return index;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (newText) {
              filterSuraListByText(newText);
            },
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
        Expanded(
          child: ListView.separated(
            itemCount: filteredSuraIndices.length,
            itemBuilder: (context, index) {
              return SuraWidget(filteredSuraIndices[index]);
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

  void filterSuraListByText(String newText) {
    var searchQuery = newText.toLowerCase();
    List<int> filteredList = [];
    for (int i = 0; i < QuranResources.englishQuranSurahs.length; i++) {
      if (QuranResources.englishQuranSurahs[i]
          .toLowerCase()
          .contains(searchQuery)) {
        filteredList.add(i);
      } else if (QuranResources.arabicQuranSuras[i]
          .toLowerCase()
          .contains(searchQuery)) {
        filteredList.add(i);
      }
    }
    setState(() {
      filteredSuraIndices = filteredList;
    });
  }
}
