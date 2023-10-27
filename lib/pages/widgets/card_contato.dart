
import 'dart:io';

import 'package:contatos/domain/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CardContato extends StatelessWidget {
  final Contact contact;
   Function  positiveButtonDialog;

   CardContato({super.key, 
   required this.contact,
   required this.positiveButtonDialog 
   });

  @override
  Widget build(BuildContext context) {
    final name = contact.name ?? "";
    var imagePerfil = contact.pathImagePerfil != null 
              ? FileImage( File(contact.pathImagePerfil!))
              : const AssetImage("assets/images/profile.png") as ImageProvider;
       
    return Card(
      
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            
             borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
            image: imagePerfil ,
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [pupUpMenu(context)],
              ),
              Container(
                color: Colors.black26,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,letterSpacing: 1,  
                    ),
                    maxLines: 1,     
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget pupUpMenu(BuildContext context) {
    SampleItem? itemSelected;

    return PopupMenuButton<SampleItem>(
        initialValue: itemSelected,
        onSelected: (valueSelected) {
          itemSelected = valueSelected;
        },
        itemBuilder: (_) => <PopupMenuEntry<SampleItem>>[
               PopupMenuItem<SampleItem>(
                child: InkWell(
                     onTap: (){
                       Navigator.pop(context);
                      },
                      child: const Row(children: [
                        FaIcon( FontAwesomeIcons.shareNodes, size: 14),
                        SizedBox( width: 5 ),
                        Text("Compartilhar"),
                      ]),
                    ),
                ),
                 PopupMenuItem<SampleItem>(
                child: InkWell(
                      onTap: (){
                          Navigator.pop(context);
                        myShowAlertDiolog(
                            context,
                            positiVeButton:  ()  =>  positiveButtonDialog()
                           );
                      },
                      child: const Row(children: [
                        FaIcon( FontAwesomeIcons.trashCan, size: 14),
                        SizedBox( width: 5 ),
                        Text("delete"),
                      ]),
                    ),
                ),
                 
            ]);
  }

  Future myShowAlertDiolog(BuildContext context,{required Function positiVeButton}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Deseja Realmente deletar este contato ?"),
              actions: [
                TextButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: const Text("Não")),
                TextButton(
                    onPressed: ()  {
                       positiVeButton();
                     Navigator.pop(context);
                    },
                    child: const Text("Sim"))
              ],
            ));
  }
}
