import 'dart:io';
import 'package:contatos/domain/use_case/validate_contact_use_case.dart';
import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/pages/streams/add_contatc_straem/add_contact_bloc.dart';
import 'package:contatos/pages/streams/add_contatc_straem/add_contatc_state.dart';
import 'package:contatos/pages/ui/home_page/home_%20page.dart';
import 'package:contatos/pages/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContact extends StatelessWidget {
  Contact? contact;
  AddContact({super.key, this.contact});

  final validateContactUseCase  = ValidateContactUseCase();

  final name = TextEditingController();

  final phoneNumber = TextEditingController();

  late final AddContactBloc _addContactBloc; 

  String titlePage = "Adicionar Contato";

  final socials = [
    "Linkedin",
    "FaceBook",
    "WhatsApp",
    "Instagram",
  ];

  var maskPhone = MaskTextInputFormatter(
      mask: '(##) 9####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void configureFieldToEdit() {
    if (contact != null) {
      contact!.pathImagePerfil != null ? _addContactBloc.image = XFile(contact!.pathImagePerfil!) : null;
      titlePage = " Editar Contato";
      name.text = contact!.name!;
      phoneNumber.text = contact!.phoneNumber!;
      _addContactBloc.selecionados = contact!.socials!.toSet();
      _addContactBloc.isFavorite = contact!.favorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    _addContactBloc = AddContactBloc();
    configureFieldToEdit();
     
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(title: Text(titlePage),
        
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16), child: uiCadastro(context)),
      ),
    ));
  }

  Future showBottomSHeet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _addContactBloc.getImageFromGallery();
                       //context.read<AddContactBloc>().getImageFromGallery();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.image,
                        size: 35,
                      ),
                    ),
                    const Text("Galeria")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _addContactBloc.cameraImage();
                       // context.read<AddContactBloc>().cameraImage();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.camera,
                        size: 35,
                      ),
                    ),
                    const Text(
                      "Galeria",
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget uiCadastro(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BlocConsumer<AddContactBloc,AddContactState>(
              bloc: _addContactBloc,
              listener: ( context, state) {  
                   if (state is AddContactPageErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error),
                      ),);
                   }
              },
              builder: (context, state) {
                return CircleAvatar(
                  radius: 120, 
                  backgroundImage: contact?.pathImagePerfil == null && _addContactBloc.image == null
                      ? const AssetImage("assets/images/profile.png") as ImageProvider
                     : FileImage(_addContactBloc.image != null
                          ? File(_addContactBloc.image!.path)
                          : File(contact!.pathImagePerfil!))
                  );
              }, 
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                  onPressed: () {
                    showBottomSHeet(context);
                  },
                  icon: const Icon(Icons.add_a_photo_outlined, size: 40)),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        MyTextField(
          textController: name,
          hintText: "Digite o nome",
          label: const Text("Nome do Contato"),
          prefixIc: const FaIcon(
            FontAwesomeIcons.person,
          ),
        ),
        const SizedBox(height: 10),
        MyTextField(
          textController: phoneNumber,
          listInputFormat: [maskPhone],
          inputType: TextInputType.phone,
          hintText: "Digite o Numero",
          label: const Text("Numerdo do Contato"),
          prefixIc: const FaIcon(FontAwesomeIcons.phone, size: 18, ),
        ),
        const SizedBox(height: 10),
        listCheckBoxSocial(),
        const SizedBox(height: 10),
        Row(
          children: [
            BlocBuilder<AddContactBloc, AddContactState>(
              bloc: _addContactBloc,
              buildWhen: (previous, current) {
                 return previous != current;
              },
               builder: (context, state) {
              return Switch(
                  value: _addContactBloc.isFavorite,
                  onChanged: (value) =>_addContactBloc.checkIsFavorite(value));
            }),
            const Text("Favorito ?"),
          ],
        ),
        const SizedBox(height: 30),
        BlocConsumer<AddContactBloc, AddContactState>(
          bloc: _addContactBloc,
          listener: (context, state) {
             if (state is SucessState ) {
              
                 ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(state.messageSuccess)));
                    _addContactBloc.onDestroy();
          
                   Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context)=>  HomePage())
                   , (route) => false); 
             }

             if(state is AddContactPageErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(state.error)));
             }
          },
          builder: (context, snapshot) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(143, 63, 104, 175),
            ),
            onPressed: () async {
              var isValidate = validateContactUseCase
                  .validateFieldContact(name.text, phoneNumber.text);
              if (isValidate) {
                    verifyCreatUpdateContact();

              } else  {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text("Preencha os campos corretamente")));
              }
            },
            child: Text(
              titlePage,
              style: const TextStyle(fontSize: 18),
            ),
          );
        })
      ],
    );
  }

  Widget listCheckBoxSocial() {
    return Column(
      children: socials
          .map((e) => BlocBuilder<AddContactBloc,AddContactState>(
            bloc: _addContactBloc,
            builder: (context, state) {
              return CheckboxListTile(
                  title: Text(e),
                  dense: true,
                  value:_addContactBloc.selecionados.contains(e),
                  onChanged: (isCheck) {
                     if(isCheck != null){
                      _addContactBloc.isCheckListSocial(isCheck,e);
                     }
                  },);
            }
          ),)
          .toList(),
    );
  }

  void verifyCreatUpdateContact(){
     if (contact == null) {
                  var contact = Contact(
                      createdAt: null,
                      favorite: _addContactBloc.isFavorite, //TODO Verificar
                      idImagePerfil: null,
                      pathImagePerfil: _addContactBloc.image?.path,
                      name: name.text,
                      objectId: null,
                      phoneNumber: maskPhone.getUnmaskedText(),
                      socials: _addContactBloc.selecionados.toList(),
                      updatedAt: null);

                      _addContactBloc.createUpdateContact(contact);

                } else {
                  contact!.name = name.text;
                  contact!.socials!.addAll(_addContactBloc.selecionados);
                  contact!.phoneNumber = phoneNumber.text;
                  contact!.favorite = false; //TODO verificar
                  contact!.socials = _addContactBloc.selecionados.toList();
                  contact?.pathImagePerfil =
                     _addContactBloc.image?.path == null && contact?.pathImagePerfil == null
                          ? null
                          : _addContactBloc.image?.path != null
                              ? _addContactBloc.image?.path
                              : contact!.pathImagePerfil;
                  contact!.idImagePerfil =
                      contact?.idImagePerfil != null
                          ? contact!.idImagePerfil
                          : null;
   
                   _addContactBloc.createUpdateContact(contact!);  
                }
  }
}


