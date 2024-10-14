import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/tabs/hadeth/hadeth_content.dart';
import 'package:islami_app/tabs/quran/sura_content.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContent.routeName: (_) => SuraContent(),
        HadethContent.routeName: (_) => HadethContent(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeApp.lightThemeData,
      darkTheme: ThemeApp.darkThemeData,
      themeMode: settingsProvider.themeMode,
    );
  }
}
