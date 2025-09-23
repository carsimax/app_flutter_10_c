import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/user_model.dart';

class RegisterUserViewModel extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  //Variables de Estado
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //Metodo para Registrar Usuario
  Future<bool> registerUser({
    required String fullName,
    required String email,
    required String password,
  })async{
    _isLoading = true;
    _errorMessage= null;
    notifyListeners();

    try{
      final userToRegister = User(
        fullName: fullName, 
        email: email,
        password: password,
      );
      await _apiService.registerUser(userToRegister);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e){
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

}