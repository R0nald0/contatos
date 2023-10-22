import 'package:contatos/domain/domain/abstract_contact_use_case.dart';
import 'package:contatos/domain/domain/repository/abstract_repository.dart';
import 'package:contatos/domain/model/contact.dart';

class ContactuseCase implements AbstractContactUseCase { 
   final AbstratcContactRepository _contactRepository ;

   ContactuseCase(this._contactRepository);

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
         return  await _contactRepository.save(contact);
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
