class Contacts {
  List<ContactDto>? _results;

  Contacts(List list, {List<ContactDto>? results}) {
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
  ImagePerfil? _imagePerfil;
  List<int>? _socials;
  String? _createdAt;
  String? _updatedAt;

  ContactDto(
      {String? objectId,
      String? name,
      String? phoneNumber,
      bool? favorite,
      ImagePerfil? imagePerfil,
      List<int>? socials,
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
    if (imagePerfil != null) {
      this._imagePerfil = imagePerfil;
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
  ImagePerfil? get imagePerfil => _imagePerfil;
  set imagePerfil(ImagePerfil? imagePerfil) => _imagePerfil = imagePerfil;
  List<int>? get socials => _socials;
  set socials(List<int>? socials) => _socials = socials;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  ContactDto.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _name = json['Name'];
    _phoneNumber = json['PhoneNumber'];
    _favorite = json['Favorite'];
    _imagePerfil = json['imagePerfil'] != null
        ? ImagePerfil.fromJson(json['imagePerfil'])
        : null;
    _socials = json['socials'].cast<int>();
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this._objectId;
    data['Name'] = this._name;
    data['PhoneNumber'] = this._phoneNumber;
    data['Favorite'] = this._favorite;
    if (this._imagePerfil != null) {
      data['imagePerfil'] = this._imagePerfil!.toJson();
    }
    data['socials'] = this._socials;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
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
