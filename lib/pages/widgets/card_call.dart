import 'package:contatos/enum/status_call.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardCall extends StatelessWidget {
  const CardCall({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          const Text("Date call 18/10/2001 ás 12:32",
           style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
           ),
          ),
          Icon(StateCall.MISSED_CALL.icon,color: StateCall.MISSED_CALL.color,)
         ],),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          const Text("Time in call 12:32",
           style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
           ),
          ),
          Text(StateCall.MISSED_CALL.title,
          style: TextStyle(
            color:StateCall.MISSED_CALL.color
          ),
          )
         ],),
         Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
          child: const Divider(thickness: 2,),
         )
      ]),
    );
  }
}