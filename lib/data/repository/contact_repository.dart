 import 'package:contatos/data/model/contact_dto.dart';
import 'package:contatos/data/service/custom_dio.dart';
import 'package:contatos/domain/domain/repository/abstract_repository.dart';
import 'package:contatos/domain/model/contact.dart';

class ContactRepository implements AbstratcContactRepository {
  final _customeDio = CustomDio().get();

  @override
   delete(String id) async {
    try {
        await _customeDio.delete("/contato/$id");
    } catch ( e) {
       rethrow;
    }
  }

  @override
  Future<Contacts> findAll() async {
    
     var result  = await _customeDio.get("/contato");
      if(result.statusCode == 200){
      var  jsonContacts  = result.data;
        return Contacts.fromJson(jsonContacts) ;
      }
      throw Exception("erro ao buscar na api");

  }

  @override
  String findByid(String id) {
    
    throw UnimplementedError();
  }

  @override
  Future<String> save(Contact contact)  async{
      try {
     var resposne  = await _customeDio.post("/contato",
        data: contact.toJson()
        );
       if (resposne.statusCode == 200) {
           var  json = resposne.data;
          return Future.value("Sucesso ao salvar");
       }
        return Future.value("falha ao salvar ${resposne.statusCode}");
      } catch (e) {
         throw e;
      }
  }

  @override
   Future<void> update(String id, Contact contact) async {
       try {
           await _customeDio.put("/contato/$id"
          ,data: contact.toJson()
          );
       } catch (e) {
          throw e;
       }
  }
   
 }