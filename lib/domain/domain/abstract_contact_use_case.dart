 import 'package:contatos/domain/model/contact.dart';


abstract class AbstractContactUseCase{
      Future<String> save(Contact contact);
     Future<List<Contact>> findAll();
     Future<void> update(String id ,Contact contact);
      delete(String? id);
     String findByid(String id);
 }