import 'package:contatos/data/model/contact_dto.dart';
import 'package:contatos/domain/model/contact.dart';


abstract  class AbstratcContactRepository{
     Future<String> save(Contact contact);
     Future<Contacts> findAll();
     Contact update(String id ,Contact contact);
      delete(String id);
     String findByid(String id);
} 