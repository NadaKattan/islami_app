import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../theme_app.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(

     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         Image.asset(
           "assets/images/radio_image.png",
           height: MediaQuery.sizeOf(context).height * .26,
         ),
        Text(AppLocalizations.of(context)!.quran_radio,style: Theme.of(context).textTheme.titleLarge,),
         SizedBox(height: 20,),
         Directionality(
           textDirection: TextDirection.ltr,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.skip_previous,color:Provider.of<SettingsProvider>(context).isDark?ThemeApp.gold: Theme.of(context).primaryColor,size: 50,),
               Icon(Icons.play_arrow,color:Provider.of<SettingsProvider>(context).isDark?ThemeApp.gold: Theme.of(context).primaryColor,size: 50),
               Icon(Icons.skip_next,color:Provider.of<SettingsProvider>(context).isDark?ThemeApp.gold: Theme.of(context).primaryColor,size: 50),
             ],
           ),
         )

       ],
     ),
   );
  }
}