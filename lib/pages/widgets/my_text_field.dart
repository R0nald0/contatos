import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTextField extends StatelessWidget {
  TextEditingController textController ;
  String hintText ="";
  Widget label ;
  Widget prefixIc;
  List<TextInputFormatter> listInputFormat ;
  TextInputType inputType ;

   MyTextField({super.key,
   required this.textController,
   required this.hintText,
   required this.label,
   required this.prefixIc,
    this.inputType = TextInputType.name,
    this.listInputFormat =const []
   });


  @override
  Widget build(BuildContext context) {
  
    return  TextField(
      controller: textController,
      inputFormatters: listInputFormat,
      keyboardType: inputType,
      decoration:  InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
          hintText: hintText,
          label: label,
          prefixIcon: prefixIc),
    );
  }



}
