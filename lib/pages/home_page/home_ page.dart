import 'package:contatos/domain/domain/abstract_contact_use_case.dart';
import 'package:contatos/domain/domain/repository/abstract_repository.dart';
import 'package:contatos/domain/domain/use_case/contato_use_case.dart';
import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/pages/add_contact_page/add_contact.dart';
import 'package:contatos/pages/contato_descricao_page/contato_descricao.page.dart';

import 'package:contatos/pages/widgets/card_contato.dart';
import 'package:contatos/data/repository/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  final AbstratcContactRepository _contactRepository  = ContactRepository();
  late  AbstractContactUseCase _contactUseCase;
  List<Contact> listContacts = [];
  
 
  void getAllContacts()async{
     _contactUseCase = ContactuseCase(_contactRepository);
     listContacts =await  _contactUseCase.findAll();
     setState(() {   });
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllContacts();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Contatos"),
       ),
       body: Container(
        child:  Column(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SearchBar(
              trailing: [
                IconButton(
                  onPressed:()=>{}, icon: const Icon(Icons.search))
              ],
              hintText: "Buscar contato",
             ),
           ),
           
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: listContacts.isEmpty 
                ?const Center(child: CircularProgressIndicator(),)
                : GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 5
                    ), 
                    itemCount: listContacts.length,
                  itemBuilder: (_,index) { 
                      var contato = listContacts[index];
                       return InkWell(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (_)=>ContatoDescricaoPage(contact: contato,))
                            );
                        },
                        child: CardContato(
                          contact: contato,
                          positiveButtonDialog:(){   
                             setState(() {
                              _contactUseCase.delete(contato.objectId);
                              getAllContacts();
                             });
                            },
                          ),
                       );
                   },
                
                  ),
              ) 
              ),
          

        ],
        ) 
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=> AddContact())
            ); },
          child:const FaIcon(FontAwesomeIcons.add),
          ),
    );
  }
}