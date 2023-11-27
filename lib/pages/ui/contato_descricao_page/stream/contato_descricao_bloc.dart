import 'package:contatos/pages/ui/contato_descricao_page/stream/contato_descricao_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDescricaoBloc extends Cubit<ContatoDescricaoState>{
  
  ContatoDescricaoBloc():super(InitStateContatoDescricao());

  void callContact(String numberPhoneUri) async{
     try {
         await launchUrl(Uri.parse(numberPhoneUri));
      } catch (e,s) {
           print(e);
           emit(ErrorContatoDescricao(erro:"Não conseguimos executar o comando,verifique os dados do contato"));
      }
  }

}