import 'dart:async';

import 'package:contatos/data/model/contact_image_dao.dart';
import 'package:hive/hive.dart';

class HiveRepository {
   static late Box _box;
   static const NAME_BOX ="image_contact";

   HiveRepository._empty();
   
   static Future<HiveRepository> initBox() async{
          if (Hive.isBoxOpen(NAME_BOX)) {
               _box = Hive.box(NAME_BOX);
          } else {
              _box = await Hive.openBox(NAME_BOX); 
          }

          return HiveRepository._empty();
   }

   Future<void> delete(int index) async{
        await _box.delete(index);
   }
   
   List<ConstactImageDAO> findAll(){
      return   _box.values.cast<ConstactImageDAO>().toList();
   }

   Future<void> update(int index  ,ConstactImageDAO contactImageDAO) async{
         await _box.putAt(index, ConstactImageDAO(contactImageDAO.idContact, contactImageDAO.imgUri));    
   }

  
   
   Future<int> save(ConstactImageDAO imageDao)  async{
      return  await _box.add(imageDao);
   }
}