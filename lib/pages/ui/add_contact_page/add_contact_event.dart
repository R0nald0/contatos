 import 'package:contatos/domain/model/contact.dart';

abstract class AddContactEvent{}

class ContatoAdd extends AddContactEvent{
      final Contact contact;
      ContatoAdd({required this.contact});
}

 class FavoriteContactEvent extends AddContactEvent {
    final isfavorite ;
     FavoriteContactEvent({required this.isfavorite});
 }

 class UpadteContact extends AddContactEvent{
      final Contact contact;
      final String id;
      UpadteContact({ required this.id ,required this.contact});
}
