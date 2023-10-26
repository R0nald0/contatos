import 'package:hive/hive.dart';

part 'contact_image_dao.g.dart';

@HiveType(typeId: 1)
 class ConstactImageDAO extends HiveObject {
    
    @HiveField(0)
    String _idContact="";
    @HiveField(1)
    String _imgUri ="";
    

    ConstactImageDAO.empty();
    ConstactImageDAO(this._idContact,this._imgUri);
    

  String get imgUri => _imgUri;
    set imgUri(imgUri) =>_imgUri = imgUri;

  String get idContact => _idContact;
  set idContact(idContact) => _idContact = idContact;
 }