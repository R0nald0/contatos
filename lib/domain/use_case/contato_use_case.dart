import 'package:contatos/data/model/contact_image_dao.dart';
import 'package:contatos/data/repository/contact_repository.dart';
import 'package:contatos/data/repository/hive_repository.dart';
import 'package:contatos/domain/abstract_contact_use_case.dart';
import 'package:contatos/domain/model/contact.dart';

class ContactuseCase implements AbstractContactUseCase { 
    final  _contactRepository = ContactRepository();
    late HiveRepository  _hiveDb ;
    var allContacts =<Contact>[];

    ContactuseCase();

   @override
   Future<String> delete(Contact? contact) async {
     try {
       if(contact?.objectId != null){
        if(contact?.pathImagePerfil != null){
             _hiveDb = await HiveRepository.initBox();
             _hiveDb.delete(int.parse(contact!.idImagePerfil!));
         } 
        _contactRepository.delete(contact!.objectId!); 
        return "Contato Excluido" ;
       }
      return "Contato com identificador inexistente";
     } catch (e) {
        throw e ;
     }
  }

  @override
 Future<List<Contact>> findAll() async {
   var list = await _contactRepository.findAll();
   return list.results!.map((e) => Contact.fromDto(e)).toList();
  }

  @override
  Future<Contact> findByid(String id) async {
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
           return "Sucesso ao slavar contato";
     } catch (e) {
        throw Exception("Falha ao Salvar dados $e");
     }
  }

  @override
Future<String> update(String id, Contact contact) async {
     try {
       await _contactRepository.update(id, contact);
       return "Sucesso ao atualizar contato";
     } catch (e ) {
       throw Exception("Falha ao Atualizar dados $e");
     }
  }
  
  @override
  Future<List<Contact>> findByName(String name) async{
       
        allContacts =  allContacts.isEmpty ? await findAll() : allContacts;
       var listFilter = <Contact>[];
       for (var element in allContacts) {
           if (element.name!.toLowerCase()!.contains(name.toLowerCase())) {
                listFilter.add(element);
           }
       }
       return listFilter;
  }
}
