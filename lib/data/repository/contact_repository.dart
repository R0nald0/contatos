 import 'package:contatos/data/model/contact_dto.dart';
import 'package:contatos/data/service/custom_dio.dart';
import 'package:contatos/domain/domain/repository/abstract_repository.dart';
import 'package:contatos/domain/model/contact.dart';
import 'package:dio/dio.dart';

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
        print(result.statusCode);
      throw Exception("erro ao buscar na api");
  
  }

  @override
  String findByid(String id) {
    // TODO: implement findByid
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
  Contact update(String id, Contact contact) {
    // TODO: implement update
    throw UnimplementedError();
  }
   
 }