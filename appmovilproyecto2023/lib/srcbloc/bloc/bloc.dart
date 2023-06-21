import 'dart:async';

import 'package:appmovilproyecto2023/srcbloc/bloc/validation.dart';

class Bloc with Validator {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();

  Stream<String> get email => emailController.stream.transform(validateEmail);
  Stream<String> get password => passwordController.stream.transform(validatePassword);

  //Recibimos un parametro de tipo String y agregamos el valor que llega al String

  Function(String) get emailChanged => emailController.sink.add;
  Function(String) get passwordChanged => passwordController.sink.add;
  dispose(){
    emailController.close();
    passwordController.close();
  }

}
final bloc=Bloc();