import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ui/home_page/home_ page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
                const FaIcon(FontAwesomeIcons.addressBook,size: 90,),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 100,
                  child: DefaultTextStyle(
                    style:  const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    
                    fontWeight: FontWeight.w500
                  ), 
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      onFinished: (){
                        Navigator.pushAndRemoveUntil(
                          context, 
                          MaterialPageRoute(builder: ((context) => HomePage())), 
                          (route) => false);
                      },    
                      animatedTexts: [
                       TypewriterAnimatedText("Contatos",
                       cursor: ".",
                       textAlign: TextAlign.center,
                       speed: const Duration( milliseconds :250), 
                       )
                    ])
                    ),
                ),
                
        ],),
      ),
    );
  }
}