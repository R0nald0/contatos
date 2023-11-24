  import 'package:contatos/domain/model/contact.dart';

  class AddContactState{
     AddContactState();
}

  class AddContactInicialState extends AddContactState {
         AddContactInicialState();
  }

  class AddContactPageLoadingState extends AddContactState {
         AddContactPageLoadingState();
  }

 class UpdatePhotoPefil extends AddContactState {
    String urlPhoto ="";
    UpdatePhotoPefil({required this.urlPhoto});
}
  
  class AddContactPageLoadedState extends AddContactState {
       final String messageSuccess;
       AddContactPageLoadedState(this.messageSuccess);
  }
  
  class FavoriteContactState extends AddContactState {
       bool isFavorite;
       FavoriteContactState({required this.isFavorite});
  }

  class IsListSocialCheck extends AddContactState {
       bool isListSocialCheck;
       IsListSocialCheck({required this.isListSocialCheck});
  }

  class SucessState extends AddContactState {
       String messageSuccess;
       SucessState({required this.messageSuccess});
  }
  
  class AddContactPageErrorState  extends AddContactState{
       final String error;
       AddContactPageErrorState({required this.error});
  }