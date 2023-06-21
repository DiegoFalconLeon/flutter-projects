import 'dart:async';
import 'package:proyectofinal/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validaEmail);
  Stream<String> get password => _password.stream.transform(validaPassword);

  Stream<bool> get submitButtonIsValid => CombineLatestStream.combine2(
      email, password, (emailValue, passwordValue) => true);

  Function(String) get emailChanges => _email.sink.add;
  Function(String) get passwordChanges => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
