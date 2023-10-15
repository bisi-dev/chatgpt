import 'package:flutter/material.dart';

import 'app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat GPT',
      theme: AppTheme.originalTheme(),
      debugShowCheckedModeBanner: false,
      home: const Placeholder(),
    );
  }
}
