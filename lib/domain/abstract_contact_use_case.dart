 import 'package:contatos/domain/model/contact.dart';


abstract class AbstractContactUseCase{
     Future<String> save(Contact contact);
     Future<List<Contact>> findAll();
     Future<List<Contact>> findByName(String name);
     Future<void> update(String id ,Contact contact);
     Future<String> delete(Contact? contact);
     Future<Contact> findByid(String id);
 }