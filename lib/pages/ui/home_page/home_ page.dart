import 'package:contatos/pages/streams/home_page/contact_bloc.dart';
import 'package:contatos/pages/streams/contato_event.dart';
import 'package:contatos/pages/streams/home_page/contato_state.dart';
import 'package:contatos/pages/ui/add_contact_page/add_contact.dart';
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


  @override
  void initState() {
    super.initState();
    print("init state");
    contactBloc = HomePageBloc();
    contactBloc.add(GetAllContacts());
    if(contactBloc.state is ContatoErrorState){
        contactBloc.stream.listen((ContatoErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("Erro ao deletar") )
                       );
         });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build state");
    
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
                // if (value.trim().isEmpty) {
                //   getAllContacts();
                // } else {
                //   listContacts = await _contactUseCase.findByName(value);
                //   setState(() {});
                // }
              },
              trailing: [
                IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
              ],
              hintText: "Buscar contato",
            ),
          ),
          BlocBuilder<HomePageBloc, ContatoState>(
              bloc: contactBloc,
              builder: (context, state) {
                if (state is ContatoLoadingState) {
                  return Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (state is ContatoLoadedState) {
                  var list = state.listContact;
                  return Expanded(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: list.isEmpty
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
                              itemCount: list.length,
                              itemBuilder: (_, index) {
                                var contato = list[index];

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
                                    positiveButtonDialog:  ()  async{
                                        contactBloc.add(DeleteContact(contact: contato));
                                        contactBloc.add(GetAllContacts());
                                        
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Sucesso ao deletar")));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ));  
                } 
                else if( state is ContatoErrorState){
                     return Text("Erro ao bucar contatos ${state.execption}");
                  }
                else {
                   return Center(child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Erro ao bucar contatos"),
                       ElevatedButton(
                       onPressed:()=> {contactBloc.add(GetAllContacts()),} ,
                       child: Text("Recarregar"))
                     ],
                   ));
                }
              })
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddContact()));
        },
        child: const FaIcon(FontAwesomeIcons.add),
      ),
    );
  }
}
