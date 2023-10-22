 import 'package:flutter/material.dart';

enum StateCall{
   MISSED_CALL( "missed call",Icons.call_received_outlined,Colors.redAccent ),
   ANSWERED_CALL( "answered call",Icons.call_made,Colors.greenAccent );


   
   final Color color ;
   final String title ;
   final IconData icon;

   const StateCall(this.title,this.icon,this.color);
 }