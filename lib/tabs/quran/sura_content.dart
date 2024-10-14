import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/quran/loading_indicator.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

import '../settings/settings_provider.dart';

class SuraContent extends StatefulWidget {
  // const SuraContent({super.key});
  static const String routeName = "/sura_content";

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  late SuraNames args;
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraNames;
    if (ayat.isEmpty) loadSuraFile();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${Provider.of<SettingsProvider>(context).background}.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
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
              Text(
                args.suraName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ayat.isEmpty
                      ? const LoadingIndicator()
                      : ListView.builder(
                          itemBuilder: (_, index) {
                            return Text(
                              ayat[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            );
                          },
                          itemCount: ayat.length,
                        ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    String sura =
        await rootBundle.loadString("assets/quran/${args.index + 1}.txt");
    ayat = sura.split("\r\n");
    setState(() {});
    // print("object");
  }
}
