

import 'package:contatos/data/model/contact_dto.dart';

class Contact {
  String? _objectId ="";
  String? _name ="";
  String? _phoneNumber = "";
  bool? _favorite= false;
  ImagePerfil? _imagePerfil ;
  List<String>? _socials = [];

  Contact(
      {String? objectId,
      String? name,
      String? phoneNumber,
      bool? favorite,
      ImagePerfil? imagePerfil,
       List<String>? socials,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (name != null) {
      _name = name;
    }
    if (phoneNumber != null) {
      _phoneNumber = phoneNumber;
    }
    if (favorite != null) {
      _favorite = favorite;
    }
    if (imagePerfil != null) {
      _imagePerfil = imagePerfil;
    }
    if (socials != null) {
      _socials = socials;
    }
  }
    
  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  bool? get favorite => _favorite;
  set favorite(bool? favorite) => _favorite = favorite;
  ImagePerfil? get imagePerfil => _imagePerfil;
  set imagePerfil(ImagePerfil? imagePerfil) => _imagePerfil = imagePerfil;
   List<String>? get socials => _socials;
  set socials( List<String>? socials) => _socials = socials;
  
  Contact.fromDto(ContactDto contactDto){
      _name = contactDto.name;
      _objectId =contactDto.objectId;
      _phoneNumber =contactDto.phoneNumber;
     // _imagePerfil = contactDto.imagePerfil;
      _socials =contactDto.socials;
      _favorite = contactDto.favorite;
  }

  Contact.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _name = json['Name'];
    _phoneNumber = json['PhoneNumber'];
    _favorite = json['Favorite'];
    _imagePerfil = json['imagePerfil'] != null
        ? ImagePerfil.fromJson(json['imagePerfil'])
        : null;
    _socials = json['socials'].cast<String>();
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['Name'] = _name;
    data['PhoneNumber'] = _phoneNumber;
    data['Favorite'] = _favorite;
    if (_imagePerfil != null) {
      data['imagePerfil'] = _imagePerfil!.toJson();
    }
    data['socials'] = _socials;
    return data;
  }
}

class ImagePerfil {
  String? _sType;
  String? _name;
  String? _url;

  ImagePerfil({String? sType, String? name, String? url}) {
    if (sType != null) {
      this._sType = sType;
    }
    if (name != null) {
      this._name = name;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get sType => _sType;
  set sType(String? sType) => _sType = sType;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get url => _url;
  set url(String? url) => _url = url;

  ImagePerfil.fromJson(Map<String, dynamic> json) {
    _sType = json['__type'];
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this._sType;
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}
