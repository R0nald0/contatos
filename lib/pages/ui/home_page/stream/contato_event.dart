  import 'package:contatos/domain/model/contact.dart';

abstract class ContatoEvent {}


  class GetAllContacts extends ContatoEvent{
       String name ;
       GetAllContacts({this.name =""}):super();
  }

  class DeleteContact  extends ContatoEvent{
     final Contact contact;
    
     DeleteContact({required this.contact});
  }
