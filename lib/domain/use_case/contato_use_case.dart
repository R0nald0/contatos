import 'package:contatos/data/model/contact_image_dao.dart';
import 'package:contatos/data/repository/contact_repository.dart';
import 'package:contatos/data/repository/hive_repository.dart';
import 'package:contatos/domain/abstract_contact_use_case.dart';
import 'package:contatos/domain/model/contact.dart';

class ContactuseCase implements AbstractContactUseCase { 
    final  _contactRepository = ContactRepository();
    late HiveRepository  _hiveDb ;

    ContactuseCase();

   @override
   delete(String? id) {
     if(id != null){

       _contactRepository.delete(id);
     }
  }

  @override
 Future<List<Contact>> findAll() async {
   var list = await _contactRepository.findAll();
   return list.results!.map((e) => Contact.fromDto(e)).toList();
  }

  @override
  String findByid(String id) {
    // TODO: implement findByid
    throw UnimplementedError();
  }

  @override
  Future<String> save(Contact contact)  async{
     try {
          if (contact.pathImagePerfil != null) {
              _hiveDb = await HiveRepository.initBox();
               var codeImage = "${contact.name}+${contact.phoneNumber}";
               var result  =await _hiveDb.save(             
               ConstactImageDAO(codeImage,contact.pathImagePerfil!)
              );
             contact.idImagePerfil = result.toString();
          }
            
           var contactSaved = await _contactRepository.save(contact);
           return contactSaved;
     } catch (e) {
        throw Exception("Falha ao Salvar dados $e");
     }
  }

  @override
Future<void> update(String id, Contact contact) async {
     try {
       await _contactRepository.update(id, contact);
     } catch (e ) {
       throw Exception("Falha ao Atualizar dados $e");
     }
  }
}
