
import 'package:contatos/pages/splash_scren/splash_screnn_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
    return MaterialApp(
          title: "Contatos",
          theme: ThemeData(
            colorScheme:ColorScheme.fromSeed(seedColor: Colors.cyan) ,
            useMaterial3: true
          ),
          home: SplashScreenPage()
          ,debugShowCheckedModeBanner: false
        );
  }
}