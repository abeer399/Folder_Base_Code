import 'package:feature_model/features/authentication/signin/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'utils/device/media_query.dart';
import 'utils/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MediaQuries(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Semi Solutions Hub',
      // themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
