import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/pages/add_contact_page/add_contact.dart';
import 'package:contatos/pages/widgets/card_call.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContatoDescricaoPage extends StatefulWidget {
  final Contact contact;
  const ContatoDescricaoPage({super.key, required this.contact});

  

  @override
  State<ContatoDescricaoPage> createState() => _ContatoDescricaoPageState();
}

class _ContatoDescricaoPageState extends State<ContatoDescricaoPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.contact.socials);
  }
 
  @override
  Widget build(BuildContext context) {
    String name = widget.contact.name ?? "";
    var imagePerfil = widget.contact.imagePerfil?.name != null 
              ?  NetworkImage(widget.contact.imagePerfil!.name!)
              : const AssetImage("assets/images/profile.png") as ImageProvider;
  
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black38,
                  expandedHeight: 260,
                  centerTitle: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                           
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call, size: 18,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (_)=>AddContact(contact: widget.contact,))
                                        );
                                    },
                                    icon: const Icon(
                                      Icons.edit, size: 18,
                                    ),
                                  ),
                                ],
                              ),
                        ],
                      ),
                      background: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imagePerfil,
                                fit: BoxFit.cover
                            ),),
                        child: Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(96, 46, 43, 43))),
                      )),
                ),
              ];
            },
            body: Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromARGB(255, 209, 208, 208),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const Text("Socials"),
                  const Divider( thickness: 1, ),
                  Expanded(
                    flex: 1,
                    child: widget.contact.socials!.isEmpty
                    ?const Center(child: Text("Sem redes sociais salvas"))
                    : ListView.builder(
                         scrollDirection: Axis.horizontal,
                          itemCount:  widget.contact.socials!.length,
                          itemBuilder: (_,index){
                                   var social  = widget.contact.socials![index];
                                  
                            return  Center(
                              child: IconButton(
                                       onPressed: () {},
                                       icon:  switch (social) {
                                       "Linkedin"   => const FaIcon(FontAwesomeIcons.linkedin),
                                       "FaceBook"   => const FaIcon(FontAwesomeIcons.facebook),
                                       "WhatsApp"   => const FaIcon(FontAwesomeIcons.whatsapp),
                                       "Instagram"  => const FaIcon(FontAwesomeIcons.instagram),
                                         String() => const FaIcon(FontAwesomeIcons.message),
                                       }
                                       ),
                            );
                          },
                       ),
                  ),
                  const SizedBox( height: 10, ),
                  const Text("Calls"),
                  const Divider(thickness: 1, ),
                  Expanded(
                       flex: 3,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Dismissible(
                                key: const Key("call"),
                                onDismissed: (direction) {
                                  // delete state call
                                },
                                child: const CardCall());
                          }))
                ],
              ),
            )),
      ),
    );
  }
}

//  IconButton(
//                               onPressed: () {},
//                               icon: const FaIcon(FontAwesomeIcons.facebook)),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const FaIcon(FontAwesomeIcons.whatsapp)),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const FaIcon(FontAwesomeIcons.instagram)),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const FaIcon(FontAwesomeIcons.message)),