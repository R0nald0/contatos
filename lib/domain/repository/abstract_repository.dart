import 'package:contatos/data/model/contact_dto.dart';
import 'package:contatos/domain/model/contact.dart';


abstract  class AbstratcContactRepository{
     Future<String> save(Contact contact);
     Future<Contacts> findAll();
     Future<void> update(String id ,Contact contact);
     Future<void> delete(String id);
     String findByid(String id);
} 