import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/tabs/hadeth/hadeth_content.dart';
// import 'package:islami_app/tabs/hadeth/hadeth_content.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  // const HadethTab({super.key});
  List<HadethModel> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) loadHadeth();
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: MediaQuery.sizeOf(context).height * .26,
        ),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(HadethContent.routeName,
                          arguments: ahadeth[index]);
                    },
                    child: Text(
                      ahadeth[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
              itemCount: ahadeth.length,
              separatorBuilder: (context, index) => const Divider()),
        )
      ],
    );
  }

  Future<void> loadHadeth() async {
    String hadethString = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> ahadethList = hadethString.split("#");
    ahadeth = ahadethList.map((hadeth) {
      List<String> hadethList = hadeth.trim().split("\r\n");
      String title = hadethList[0];
      hadethList.removeAt(0);
      List<String> content = hadethList;
      return HadethModel(title: title, hadethContent: content);
    }).toList();
    setState(() {});
  }
}

class HadethModel {
  String title;
  List<String> hadethContent;
  HadethModel({required this.title, required this.hadethContent});
}
