 import 'package:contatos/pages/streams/contato_event.dart';
import 'package:contatos/pages/streams/home_page/contato_state.dart';
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
      if ( event is ContatoAdd) {
            try {
               await _contactUseCase.save(event.contact);
               listContacts = await _contactUseCase.findAll();
            } catch (e) {
               emit(ContatoErrorState(execption: Exception(e)));
            }
      } else if (event is DeleteContact) {
           try {
            await _contactUseCase.delete(event.contact);
            listContacts = await _contactUseCase.findAll();
           } catch (e) {
             emit(ContatoErrorState(execption: Exception(e)));
           }
      } else if (event is GetAllContacts){
         try {
            listContacts = await _contactUseCase.findAll();
         } catch (e) {
               emit(ContatoErrorState(execption: Exception(e)));
         }
      }
    
     emit(ContatoLoadedState(listContatcs: listContacts));
   }
 }