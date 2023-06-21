import 'package:appmovilproyecto2023/home.dart';
import 'package:appmovilproyecto2023/screensDrawer/battery.dart';
import 'package:appmovilproyecto2023/screensDrawer/contact.dart';
import 'package:appmovilproyecto2023/screensDrawer/screenInfinita/infinita.dart';
import 'package:appmovilproyecto2023/screensDrawer/settings.dart';
import 'package:appmovilproyecto2023/screensFirebase/datos_screen.dart';
import 'package:appmovilproyecto2023/screensFirebase/login_screens.dart';
import 'package:appmovilproyecto2023/screensFirebase/registration_screen.dart';
import 'package:appmovilproyecto2023/screensFirebase/welcome_screens.dart';
import 'package:appmovilproyecto2023/screensform/validationform.dart';
import 'package:appmovilproyecto2023/srcbloc/appbloc.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MaterialApp(
    //home: Home(),
    home: WelcomeScreens(),
    debugShowCheckedModeBanner:  false,
    //Mapeamos las rutas
    theme: ThemeData(textTheme: TextTheme()),
    initialRoute: WelcomeScreens.routeName,
    routes: <String, WidgetBuilder>
    {
      Home.routeName: (BuildContext context) => Home(),
      Settings.routeName: (BuildContext context) => Settings(),
      Battery.routeName: (BuildContext context) => Battery(),
      Contact.routeName: (BuildContext context) => Contact(),
      Infinita.routeName: (BuildContext context) => Infinita(),
      Validation.routeName: (BuildContext context) => Validation(),
      Appbloc.routeName: (BuildContext context) => Appbloc(),
      WelcomeScreens.routeName: (BuildContext context) => WelcomeScreens(),
      LoginScreen.routeName: (BuildContext context) => LoginScreen(),
      RegistrationScreen.routeName: (BuildContext context) => RegistrationScreen(),
      Datos.routeName: (BuildContext context) => Datos(),
    }
  ));
}


