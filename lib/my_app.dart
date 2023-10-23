import 'package:contatos/pages/home_page/home_%20page.dart';
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
      home: HomePage()
      ,debugShowCheckedModeBanner: false
      ,
    );
  }
}