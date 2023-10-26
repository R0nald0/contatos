

import 'package:contatos/data/model/contact_dto.dart';

class Contact {
  String? _objectId;
  String? _name;
  String? _phoneNumber;
  bool? _favorite;
  String? _pathImagePerfil;
  String? _idImagePerfil;
  List<String>? _socials;
  String? _createdAt;
  String? _updatedAt;

  Contact(
      {String? objectId,
      String? name,
      String? phoneNumber,
      bool? favorite,
      String? pathImagePerfil,
      String? idImagePerfil,
      List<String>? socials,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      this._objectId = objectId;
    }
    if (name != null) {
      this._name = name;
    }
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (favorite != null) {
      this._favorite = favorite;
    }
    if (pathImagePerfil != null) {
      this._pathImagePerfil = pathImagePerfil;
    }
    if (idImagePerfil != null) {
      this._idImagePerfil = idImagePerfil;
    }
    if (socials != null) {
      this._socials = socials;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

   Contact.fromDto(ContactDto contactDto){
      _name = contactDto.name;
      _objectId =contactDto.objectId;
      _phoneNumber =contactDto.phoneNumber;
      _pathImagePerfil = contactDto.pathImagePerfil;
      _idImagePerfil = contactDto.idImagePerfil;
      _socials =contactDto.socials;
      _favorite = contactDto.favorite;
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  bool? get favorite => _favorite;
  set favorite(bool? favorite) => _favorite = favorite;
  String? get pathImagePerfil => _pathImagePerfil;
  set pathImagePerfil(String? pathImagePerfil) =>
      _pathImagePerfil = pathImagePerfil;
  String? get idImagePerfil => _idImagePerfil;
  set idImagePerfil(String? idImagePerfil) => _idImagePerfil = idImagePerfil;
  List<String>? get socials => _socials;
  set socials(List<String>? socials) => _socials = socials;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Contact.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _name = json['Name'];
    _phoneNumber = json['PhoneNumber'];
    _favorite = json['Favorite'];
    _pathImagePerfil = json['pathImagePerfil'];
    _idImagePerfil = json['idImagePerfil'];
    _socials = json['socials'].cast<String>();
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['Name'] = _name;
    data['PhoneNumber'] = _phoneNumber;
    data['Favorite'] = _favorite;
    data['pathImagePerfil'] = _pathImagePerfil;
    data['idImagePerfil'] = int.parse(_idImagePerfil ?? "10020309391");
    data['socials'] = _socials;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }
}
