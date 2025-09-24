import 'package:dio/dio.dart';
import 'package:frontend/models/user_model.dart';

class ApiService{
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8080/api'));

  Future<User> registerUser(User user) async{
    try {
      final respose = await _dio.post(
        '/users/register',
        data: user.toJson()
      );
      if(respose.statusCode == 201){
        User responseUser =User.fromJson(respose.data);
        print('Usuario Registrado: ${responseUser.toString()}');
        return responseUser;
      }else{
        throw DioException(
          requestOptions: respose.requestOptions,
          response: respose,
          error: 'Error al Registrar el Usuario: ${respose.statusCode}'
        );
      }
    } on DioException catch(e) {
      final errorMessage = e.response?.data?.toString();
      throw Exception('Error al Registrar el Usuario: $errorMessage');
    }
  }
}