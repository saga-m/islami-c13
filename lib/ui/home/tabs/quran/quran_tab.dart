import 'package:flutter/material.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/home/tabs/quran/sura_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
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
}
