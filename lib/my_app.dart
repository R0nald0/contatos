
import 'package:contatos/pages/splash_scren/splash_screnn_page.dart';
import 'package:contatos/pages/streams/add_contatc_straem/add_contact_bloc.dart';
import 'package:contatos/pages/streams/home_page/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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