 import 'package:contatos/pages/ui/home_page/stream/contato_event.dart';
import 'package:contatos/pages/ui/home_page/stream/contato_state.dart';
import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/domain/use_case/contato_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<ContatoEvent,ContatoState> {

  final _contactUseCase =ContactuseCase();
  
  HomePageBloc() : super(ContatoInitState()) {
     on(_observeEventToState);
  }
   void _observeEventToState(ContatoEvent event , Emitter emitter) async{
     List<Contact> listContacts =[];

     emit(ContatoLoadingState()); 
       if (event is DeleteContact) {
           try {
              await _contactUseCase.delete(event.contact);
           } catch (e) {
             emit(ContatoErrorState(execption: "${e}"));
           }
      } else if (event is GetAllContacts){
         try {
            listContacts = await _contactUseCase.findAll();
         } catch (e) {
             emit(ContatoErrorState(execption: "${e}"));
         }
      }
    
     emit(ContatoLoadedState(listContatcs: listContacts));
   }
 }