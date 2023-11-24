  import 'package:contatos/domain/model/contact.dart';

abstract class ContatoState{
     final List<Contact> listContact;
      ContatoState({required this.listContact});
  }


  class ContatoInitState extends ContatoState{
       ContatoInitState() : super(listContact: []);
  }
  class ContatoLoadingState extends ContatoState{
        ContatoLoadingState():super(listContact: []);
  }

  class ContatoLoadedState extends ContatoState{
      final List<Contact> listContatcs;
      ContatoLoadedState({required this.listContatcs}):super(listContact: listContatcs);
  }

  class ContatoErrorState extends ContatoState{
        final Exception execption ;
         
        ContatoErrorState({required this.execption}):super(listContact: []);
  } 

