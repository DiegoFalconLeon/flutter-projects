import 'dart:async';

class Validator{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.isEmpty){
          sink.addError("Email es requerido");
      }else if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Email no es correcto");
      }
    }
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.isEmpty){
          sink.addError("La contraseña no puede estar vacia");
      }else if(password.length > 6){
        sink.add(password);
      }else{
        sink.addError("Contraseña debe tener mas de 6 caracteres");
      }
    }
  );
  
}