import 'dart:async';

class Validator {
  //Recibe 2 datos
  final validaEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains("@") && email.contains(".com")) {
        sink.add(email);
      } else {
        sink.addError("correo invalido");
      }
    },
  );

  final validaPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 5) {
        sink.add(password);
      } else {
        sink.addError("contraseña debil en la seguridad");
      }
    },
  );
}
