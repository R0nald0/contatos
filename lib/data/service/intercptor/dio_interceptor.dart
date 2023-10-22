import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {

    final _aplicationId ="oo9aA5b3uwsOASzPa8knyVcoK06F5SxoCzudqDIV";
   final _xparse_RestAPIKey ="HMxensRWa20lADVMvM1kvo1pRqRYPHGlrG2cHIjO";
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    
         print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
     // options.headers["X-Parse-Application-Id"]="oo9aA5b3uwsOASzPa8knyVcoK06F5SxoCzudqDIV";
     // options.headers["X-Parse-REST-API-Key"] = "HMxensRWa20lADVMvM1kvo1pRqRYPHGlrG2cHIjO";
     
     print('REQUEST[${options.method}] => PATH: ${options.path}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
     print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  }
  
}