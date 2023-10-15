import 'package:chatgpt/modules/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/cupertino_modal_sheet_route.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Chat GPT',
      theme: AppTheme.originalTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoModalSheetRoute(
              settings: settings,
              builder: (BuildContext context) {
                return const HomeScreen();
              },
            );
        }
        return null;
      },
    );
  }
}
