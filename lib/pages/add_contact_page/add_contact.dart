import 'dart:io';
import 'package:contatos/data/repository/contact_repository.dart';
import 'package:contatos/domain/domain/abstract_contact_use_case.dart';
import 'package:contatos/domain/domain/repository/abstract_repository.dart';
import 'package:contatos/domain/domain/use_case/contato_use_case.dart';
import 'package:contatos/domain/domain/use_case/validate_contact_use_case.dart';
import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/pages/home_page/home_%20page.dart';
import 'package:contatos/pages/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContact extends StatefulWidget {
  Contact? contact;
   AddContact({super.key,this.contact});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  final  validateContactUseCase = ValidateContactUseCase();
  late AbstratcContactRepository _contactRepository ;
  late AbstractContactUseCase  _contactUseCase  ;
  final imagePerfil =
      "https://img.freepik.com/fotos-gratis/estilo-de-vida-beleza-e-moda-conceito-de-emocoes-de-pessoas-jovem-gerente-de-escritorio-feminino-asiatico-ceo-com-expressao-satisfeita-em-pe-sobre-um-fundo-branco-sorrindo-com-os-bracos-cruzados-sobre-o-peito_1258-59329.jpg";
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  String  titlePage= "Adicionar Contato";

  var isFavorite = false;
  var selecionados = <String>{};
  final socials = [
    "Linkedin",
    "FaceBook",
    "WhatsApp",
    "Instagram",
  ];
   XFile? image  ;

   var maskPhone  =MaskTextInputFormatter(
      mask: '(##) 9####-####', 
     filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
   );
  
  void initInstance(){

    _contactRepository = ContactRepository();
    _contactUseCase = ContactuseCase(_contactRepository);
  }
  void saveImage() async{
    final ImagePicker picker = ImagePicker();
     image = await picker.pickImage(source: ImageSource.gallery);
  }

  void cameraImage() async{
      final ImagePicker picker = ImagePicker();
      image  = await picker.pickImage(source: ImageSource.camera);
      //String path = (await path_provider.getApplicationDocumentsDirectory()).path;      
  }

  void configureFieldToEdit(){
       if(widget.contact != null ){
           titlePage = " Editar Contato";
           name.text=widget.contact!.name!;
           phoneNumber.text=widget.contact!.phoneNumber!;
           setState(() {
             isFavorite =widget.contact!.favorite!;
            });
       }
  }
   
   @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    configureFieldToEdit();
    initInstance();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
         title:  Text(titlePage)
        ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: image == null 
                     ? null
                     : FileImage(File(image!.path)),
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
                prefixIc: const FaIcon(FontAwesomeIcons.person),
              ),
              const SizedBox(height: 10),
              MyTextField(
                textController: phoneNumber,
                listInputFormat: [maskPhone],
                inputType: TextInputType.phone,
                hintText: "Digite o Numero",
                label: const Text("Numerdo do Contato"),
                prefixIc: const FaIcon(FontAwesomeIcons.person),
              ),
              const SizedBox(height: 10),
               Column(
                  children: 
                     socials.map((e) => CheckboxListTile(
                      title: Text(e),
                      dense: true,
                      value: selecionados.contains(e), 
                      onChanged: (isCheck){
                           if (isCheck!) { 
                              setState(() {
                                selecionados.add(e);  
                              });
                           } else {
                            setState(() {
                              selecionados.remove(e);
                           });                        
                           }
                           print(selecionados);
                        }
                      )                   
                     ).toList()
                  ,
               ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Switch(
                      value: isFavorite,
                      onChanged: (value) {
                        setState(() {
                          isFavorite = value!;
                        });
                      }),
                      Text("Favorito ?"),
                ],
              ),
              
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(143, 63, 104, 175),
                  ),
                  onPressed: () {
                        
                        var isValidate =validateContactUseCase.validateFieldContact(name.text, phoneNumber.text);
                        if (isValidate) {
                              
                             if(widget.contact == null ) {
                                var contact =Contact(
                               createdAt: null,
                               favorite: isFavorite,
                               imagePerfil:null,
                               name: name.text,
                               objectId: null,
                               phoneNumber: phoneNumber.text,
                               socials: [],
                               updatedAt: null
                               ) ;
                                 _contactUseCase.save(contact);
                             }else{
                                 widget.contact!.name = name.text;
                                 widget.contact!.phoneNumber = phoneNumber.text;
                                 widget.contact!.favorite = isFavorite;
                                _contactUseCase.update(widget.contact!.objectId!,widget.contact! ); 
                             }
                                          
                                          
                            Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_)=>const HomePage()), 
                            (route) => false);
                        } else {
                           ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Preencha os campos corretamente"))
                           );
                        }
                  },
                  child:  Text(titlePage,
                    style: const TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    ));
  }

Future showBottomSHeet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                       Navigator.pop(context);
                          saveImage();
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
                      cameraImage();
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

}


