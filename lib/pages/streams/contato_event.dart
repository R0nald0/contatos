  import 'package:contatos/domain/model/contact.dart';

abstract class ContatoEvent {}

  class ContatoAdd extends ContatoEvent{
      final Contact contact;
      ContatoAdd({required this.contact});
  }

  class GetAllContacts extends ContatoEvent{}

  class UpadteContact extends ContatoEvent{
      final Contact contact;
       final String id;
      UpadteContact({ required this.id ,required this.contact});
  }

  class DeleteContact  extends ContatoEvent{
     final Contact contact;
    
     DeleteContact({required this.contact});
  }

  class FavoriteContactEvent extends ContatoEvent {
      final bool isFavorite;
       FavoriteContactEvent({required this.isFavorite});
  }