import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/theme_app.dart';

class SuraContent extends StatelessWidget {
  // const SuraContent({super.key});
  static const String routeName = "/sura_content";
  List<String> ayat = [
    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'الرَّحْمَنِ الرَّحِيمِ',
    'مَالِكِ يَوْمِ الدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين'
  ];
  @override
  Widget build(BuildContext context) {
    SuraNames args = ModalRoute.of(context)!.settings.arguments as SuraNames;
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
              Text(
                args.suraName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
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
}
