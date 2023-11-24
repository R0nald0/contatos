
class  ContatoView{
   final  String name;
   final String phoneNumber;
   final bool favorite;
   final String imagePerfil;
   final Set listSocial ;
  
   ContatoView({
    this.favorite = false, 
    this.name ="",
    this.imagePerfil ="",
    this.phoneNumber ="",
    this.listSocial = const <String>{}
     });
  
  ContatoView  copyWith(
  {String? name , String? phoneNumber, bool? favorite, String? imagePerfil, Set? listSocial}){
       return ContatoView(
             favorite : favorite ?? this.favorite,
             name : name ?? this.name,
             imagePerfil: imagePerfil ?? this.imagePerfil,
             phoneNumber: phoneNumber ?? this.imagePerfil,
             listSocial : listSocial ?? this.listSocial
        );
  }

  
  // String get name => _name;
  // set name(name) => this.name =name;   

  // String get phoneNumber => phoneNumber;
  //  set phoneNumber(phoneNumber) => phoneNumber =phoneNumber; 
  
  // String get imagePerfil => imagePerfil;
  //  set imagePerfil(imagePerfil) => imagePerfil =imagePerfil; 

  // bool get favorite => favorite;
  // set favorite(favorite) => this.favorite = favorite;

  // Set get listSocial =>  this.listSocial;
  //  set listSocial(listSocial) => this.listSocial = listSocial; 
}