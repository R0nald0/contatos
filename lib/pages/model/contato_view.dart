
class  ContatoView{
    String _name ="";
    String _phoneNumber ="";
    bool _favorite = false;
    String _imagePerfil = "";
  
   ContatoView(this._favorite,this._name,this._imagePerfil,this._phoneNumber);

  
  String get name => _name;
  set name(name) => this._name =name;   

  String get phoneNumber => _phoneNumber;
   set phoneNumber(phoneNumber) => _phoneNumber =phoneNumber; 
  
  String get imagePerfil => _imagePerfil;
   set imagePerfil(imagePerfil) => _imagePerfil =imagePerfil; 

  bool get favorite => _favorite;
  set favorite(favorite) => this._favorite = favorite;
}