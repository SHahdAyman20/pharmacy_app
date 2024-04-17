import 'package:dio/dio.dart';

class AppDio {

  static late Dio _dio;

  static void init(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl: '',
    );
    _dio = Dio(baseOptions);
  }

  static Future getData() async{
    final response = await _dio.get(
      '',
      queryParameters: {
        'apiKey': '',
      },
    );
    return response.data[''];
  }
}