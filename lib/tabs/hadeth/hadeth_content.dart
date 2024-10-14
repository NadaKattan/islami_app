import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/loading_indicator.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

import '../settings/settings_provider.dart';

class HadethContent extends StatelessWidget {
  static const String routeName = "/hadeth_content";
  late HadethModel args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${Provider.of<SettingsProvider>(context).background}.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Provider.of<SettingsProvider>(context).isDark?ThemeApp.darkPrimary:ThemeApp.white, borderRadius: BorderRadius.circular(25)),
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
