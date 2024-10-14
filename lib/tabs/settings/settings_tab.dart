import 'package:flutter/material.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  // const SettingsTab({super.key});
  List<Language> languages = [
    Language(languageCode: "en", languageName: "English"),
    Language(languageCode: "ar", languageName: "العربية"),
    // Language(languageCode: "es", languageName: "spanish"),
  ];
@override
  void initState() {
    super.initState();
    Provider.of<SettingsProvider>(context,listen: false).getData();
  }
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40, top: 70),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.dark_theme,
                  style: Theme.of(context).textTheme.titleLarge),
              Switch(
                  value: settingsProvider.isDark,
                  onChanged: (value) => settingsProvider
                      .changeTheme(value ? ThemeMode.dark : ThemeMode.light))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.titleLarge),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: settingsProvider.languageCode,
                  items: languages
                      .map((language) => DropdownMenuItem(
                          value: language.languageCode,
                          child: Text(language.languageName,
                              style: Theme.of(context).textTheme.titleLarge)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      settingsProvider.changeLanguage(value);
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Provider.of<SettingsProvider>(context).isDark
                      ? ThemeApp.darkPrimary
                      : ThemeApp.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}

class Language {
  String languageName = "English";
  String languageCode = "en";
  Language({required this.languageName, required this.languageCode});
}
