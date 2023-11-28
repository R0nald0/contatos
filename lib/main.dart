import 'package:contatos/data/model/contact_image_dao.dart';
import 'package:contatos/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  var local =await path_provider.getApplicationDocumentsDirectory();
  Hive.init(local.path);
  Hive.registerAdapter(ConstactImageDAOAdapter());
  
  runApp(const MyApp());
}
 