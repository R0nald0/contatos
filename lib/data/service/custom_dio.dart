import 'package:contatos/data/service/intercptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio {
   final _myDio =Dio();
 
   final applicatioJson ="application/json";
   final baseUrl ="https://parseapi.back4app.com/classes";

  CustomDio(){
    _myDio.options.headers["X-Parse-Application-Id"]=dotenv.get('X_PARSE_APPLICATION_ID');
    _myDio.options.headers["X-Parse-REST-API-Key"] = dotenv.get('X_REST_API_KEY');
     
    _myDio.options.headers['content-type']= applicatioJson;
    _myDio.options.baseUrl = baseUrl;
    //_myDio.interceptors.add(DioInterceptor());
  
  }

  Dio get() => _myDio;
}