import 'package:contatos/domain/model/contact.dart';
import 'package:contatos/domain/use_case/contato_use_case.dart';
import 'package:contatos/pages/model/contato_view.dart';
import 'package:contatos/pages/ui/add_contact_page/stream/add_contatc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddContactBloc extends Cubit<AddContactState> {
  final _contactUseCase = ContactuseCase();
  
  var isFavorite ;
  var selecionados = <String>{}; 
  ContatoView contatoView = ContatoView();
  XFile? image;

  AddContactBloc() : super(AddContactInicialState()) {
    this.isFavorite = false;
  }

  void checkIsFavorite(value) {
    print("valuie ${value}");
    isFavorite = value;
    emit(FavoriteContactState(isFavorite: value));
  }

  void isCheckListSocial(bool check, String socialName) {
    print("valuie ${check} socialName ${socialName}");

    if (check) {
      selecionados.add(socialName);
    } else {
      selecionados.remove(socialName);
      emit(IsListSocialCheck(isListSocialCheck: check));
    }
      emit(IsListSocialCheck(isListSocialCheck: check));
      print(selecionados);
  }

  void getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image?.path != null) {
      print(image!.path);
      emit(UpdatePhotoPefil(urlPhoto: image!.path));
    } else {
      emit(AddContactPageErrorState(error: "Nenhuma imagem selecionada"));
      print("Nenhuma imagem selecionada");
    }
  }

  void cameraImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.camera);
    if (image?.path != null) {
      print(image!.path);
      emit(UpdatePhotoPefil(urlPhoto: image!.path));
    } else {
       emit(AddContactPageErrorState(error: "Nenhuma imagem selecionada"));
      print("Nenhuma imagem selecionada");
    }
  }
  
  void createUpdateContact(Contact contact) async{
        try {
          var result ="";
          if (contact.objectId == null) {
                result  = await  _contactUseCase.save(contact);
           }else{
                result = await _contactUseCase.update(contact.objectId!, contact);
           }
            
           emit(SucessState(messageSuccess: result));
        } catch (e) {
           print(e);
           emit(AddContactPageErrorState(error: "erro ao realizar operação "));
        }
  }

  void onDestroy(){
    this.close();
  }
  // void _mapEventToState(ContatoEvent event,Emitter emitter) async{

  //    emit(AddContactPageLoadingState());
  //        if ( event is ContatoAdd) {
  //         try {
  //             _result = await _contactUseCase.save(event.contact);
  //         } catch (e) {
  //           _result = e.toString();
  //            emit(AddContactPageErrorState(error: "erro $e"));
  //         }
  //   }
  // }

  // Contact? get contact => this._contact;
  // String get result => this._result;
  // set result(result) => this.result = result;
  // bool get isFavorite => this._isFavorite;
  // set isFavorite(isFavorite) =>  this.isFavorite = isFavorite;
}
