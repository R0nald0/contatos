class Contacts {
  List<ContactDto>? _results;

  Contacts({List<ContactDto>? results}) {
    if (results != null) {
      this._results = results;
    }
  }

  List<ContactDto>? get results => _results;
  set results(List<ContactDto>? results) => _results = results;

  Contacts.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = <ContactDto>[];
      json['results'].forEach((v) {
        _results!.add(new ContactDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactDto {
  String? _objectId;
  String? _name;
  String? _phoneNumber;
  bool? _favorite;
  String? _pathImagePerfil;
  String? _idImagePerfil;
  List<String>? _socials;
  String? _createdAt;
  String? _updatedAt;

  ContactDto(
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

  ContactDto.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _name = json['Name'];
    _phoneNumber = json['PhoneNumber'];
    _favorite = json['Favorite'];
    _pathImagePerfil = json['pathImagePerfil'];
    _idImagePerfil = json['idImagePerfil'].toString();
    _socials = json['socials'].cast<String>();
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this._objectId;
    data['Name'] = this._name;
    data['PhoneNumber'] = this._phoneNumber;
    data['Favorite'] = this._favorite;
    data['pathImagePerfil'] = this._pathImagePerfil;
    data['idImagePerfil'] = this._idImagePerfil;
    data['socials'] = this._socials;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}