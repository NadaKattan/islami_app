import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/loading_indicator.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/theme_app.dart';

class HadethContent extends StatelessWidget {
  static const String routeName = "/hadeth_content";
  late HadethModel args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: ThemeApp.white, borderRadius: BorderRadius.circular(25)),
          margin: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.12,
              bottom: MediaQuery.sizeOf(context).height * 0.05,
              left: 16,
              right: 16),
          child: Column(
            children: [
              // Text(
              //   args.title,
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (_, index) {
                  return Text(
                    args.hadethContent[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
                itemCount: args.hadethContent.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
