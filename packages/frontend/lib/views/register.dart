import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/viewmodels/register_user_view_model.dart';

class RegisterView extends StatelessWidget{
  //Constructor
  RegisterView({super.key});
  //Definir los controladores de texto
  final TextEditingController _fullNameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_)=> RegisterUserViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Pantalla de Registro'),),
        body: Consumer(
          builder: (context, RegisterUserViewModel viewModel, child){
            return Column(
              children: [
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(labelText: 'Nombre Completo'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    final fullName = _fullNameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    viewModel.registerUser(
                      fullName: fullName,
                      email: email,
                      password: password,
                    );
                  },
                  child: Text('Registrarse')
                ),
                viewModel.isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
                viewModel.errorMessage != null ? Text(viewModel.errorMessage!) : SizedBox.shrink(),
              ],
            );
          }
        ),
      ),
    );
  }

}