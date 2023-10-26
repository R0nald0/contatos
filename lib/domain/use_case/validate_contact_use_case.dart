 class ValidateContactUseCase {
     
     bool validateFieldContact(String name,String phoneNumer){
             if (name.isEmpty || phoneNumer.isEmpty) {
                return false;
             }
             return true;             
     }

 }