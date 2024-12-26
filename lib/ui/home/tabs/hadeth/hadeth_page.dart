import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethPage extends StatefulWidget {
  int index;

  HadethPage(this.index, {super.key});

  @override
  State<HadethPage> createState() => _HadethPageState();
}

class _HadethPageState extends State<HadethPage> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadeth(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/hadeth_card_background.png")),
        ),
        child: hadeth == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    hadeth?.title ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void loadHadeth(int index) async {
    var fileName = "assets/hadeth/h${index}.txt";
    var fileContent = await rootBundle.loadString(fileName);
    int firstLineIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, firstLineIndex);
    String content = fileContent.substring(firstLineIndex + 1);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      hadeth = Hadeth(title, content);
    });
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}
