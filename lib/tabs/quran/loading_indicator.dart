import 'package:flutter/material.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Provider.of<SettingsProvider>(context).isDark? ThemeApp.white:Theme.of(context).primaryColor,
      ),
    );
  }
}
