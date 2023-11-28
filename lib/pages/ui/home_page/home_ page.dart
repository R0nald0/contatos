import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/pages/ui/home_page/stream/contact_bloc.dart';
import 'package:contatos/pages/ui/home_page/stream/contato_event.dart';
import 'package:contatos/pages/ui/home_page/stream/contato_state.dart';
import 'package:contatos/pages/ui/add_contact_page/add_contact_page.dart';
import 'package:contatos/pages/ui/contato_descricao_page/contato_descricao.page.dart';

import 'package:contatos/pages/widgets/card_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final  AbstractContactUseCase _contactUseCase = ContactuseCase();
  // List<Contact> listContacts = [];
  late HomePageBloc contactBloc;
  final searchEditTextController = TextEditingController();
  var list =<Contact>[]; 

  @override
  void initState() {
    super.initState();

    contactBloc = HomePageBloc();
    contactBloc.add(GetAllContacts());
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              controller: searchEditTextController,
              onChanged: (value) async {
                  contactBloc.add(GetAllContacts(name: value.trim()));
              },
              trailing: [
                IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
              ],
              hintText: "Buscar contato",
            ),
          ),
          BlocConsumer<HomePageBloc, ContatoState>(
              bloc: contactBloc,
              listener: (BuildContext context, ContatoState state) { 
                   if (state is ContatoErrorState) {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text(state.execption) )
                       );
                   }
               },
              builder: (context, state) {
                if (state is ContatoLoadingState) {
                  return Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (state is ContatoLoadedState) {
                  return widgetListContact(context,state.listContact);  
                }
                else {
                   return Expanded(child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Algo deu errado ao bucar contatos"),
                       ElevatedButton(
                       onPressed:()=> {contactBloc.add(GetAllContacts()),},
                       child: Text("Recarregar",
                           style: TextStyle(
                             fontSize: 17,
                               color: Colors.white
                       ),
                       ))
                     ],
                   ));
                }
              }, )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddContactPage()));
        },
        child: const FaIcon(FontAwesomeIcons.add),
      ),
    );
  }

  Expanded widgetListContact(BuildContext context,List<Contact> contacts) {
    return Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: contacts.isEmpty
                      ? const Center(
                          child: Text("Nenhum contato na lista"),
                        )
                      : RefreshIndicator(
                          onRefresh: () async{
                              contactBloc.add(GetAllContacts());
                          },
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 0.8,
                                    mainAxisSpacing: 5),
                            itemCount: contacts.length,
                            itemBuilder: (_, index) {
                              var contato = contacts[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ContatoDescricaoPage(
                                                contact: contato,
                                              )));
                                },
                                child: CardContato(
                                  contact: contato,
                                  positiveButtonDialog:  (){
                                      contactBloc.add(DeleteContact(contact: contato));
                                      contactBloc.add(GetAllContacts());                               
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                ));
  }
}
