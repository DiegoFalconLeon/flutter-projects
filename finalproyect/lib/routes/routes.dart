import 'package:finalproyect/models/models.dart';
import 'package:finalproyect/screen/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static List<Models> modelo = [
    Models(
        icon: Icons.list_alt,
        titulo: 'Listview tipo 1',
        screen: const ListView1Screen(),
        ruta: 'listview1'),
    Models(
        icon: Icons.list,
        titulo: 'Listview tipo 2',
        screen: const ListView2Screen(),
        ruta: 'listview2'),
    Models(
        icon: Icons.add_alert_outlined,
        titulo: 'Alertas-Alerts',
        screen: const AlertScreen(),
        ruta: 'alerta'),
    Models(
        icon: Icons.credit_card,
        titulo: 'Tarjetas-cards',
        screen: const CardScreen(),
        ruta: 'card'),
    Models(
        icon: Icons.person,
        titulo: 'Circle avatar',
        screen: const AvatarScreen(),
        ruta: 'avatar'),
    Models(
        icon: Icons.inbox_outlined,
        titulo: 'Animated container',
        screen: const AnimatedScreen(),
        ruta: 'animated'),
    Models(
        icon: Icons.calendar_month,
        titulo: 'Calendario',
        screen: const CalendarScreen(),
        ruta: 'calendar'),
    Models(
        icon: Icons.play_for_work,
        titulo: 'Slider && Checks',
        screen: const SliderScreen(),
        ruta: 'slider'),
    Models(
        icon: Icons.ice_skating,
        titulo: 'InifiniteScroll && Pull to Refresh',
        screen: const InfiniteScrollScreen(),
        ruta: 'infinite'),
  ];

  static Map<String, Widget Function(BuildContext context)> routes() {
    Map<String, Widget Function(BuildContext)> initial = {};
    initial.addAll({LoginScreen.routeName: (context) => const LoginScreen()});
    initial.addAll(
        {RegistroScreen.routeName: (context) => const RegistroScreen()});
    initial.addAll(
        {PrincipalScreen.routeName: (context) => const PrincipalScreen()});
    for (var elemento in modelo) {
      initial.addAll({elemento.ruta: (context) => elemento.screen});
    }
    return initial;
  }
}
