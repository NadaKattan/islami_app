import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/tabs/radio/radio_tab.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 4;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/${Provider.of<SettingsProvider>(context).background}.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.title),
        ),
        // backgroundColor: Colors.transparent,
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/images/icon_quran.png')),
              label: AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: AppLocalizations.of(context)!.hadeth,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              label: AppLocalizations.of(context)!.sebha,
            ),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
