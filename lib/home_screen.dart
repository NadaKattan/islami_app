import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/tabs/radio/radio_tab.dart';
import 'package:islami_app/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;
  List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        // backgroundColor: Colors.transparent,
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: "Radio"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
