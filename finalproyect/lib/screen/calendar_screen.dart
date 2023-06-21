import 'dart:async';

import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _fecha = DateTime.now();

  TimeOfDay _alarma = TimeOfDay.now();

  int _inicio = 10;

  void _showCalendar() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(3000))
        .then((value) {
      setState(() {
        _fecha = value!;
      });
    });
  }

  void _showAlarm() {
    showTimePicker(
      context: context,
      initialTime: _alarma,
    ).then((value) {
      setState(() {
        _alarma = value!;
      });
    });
  }

  void _playing() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_inicio > 0) {
        setState(() {
          _inicio--;
        });
      } else {
        _inicio = 11;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fecha de registro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_fecha.year.toString()}/${_fecha.month.toString()}/${_fecha.day.toString()}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: _showCalendar,
              color: Colors.indigo,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  'calendario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              _alarma.format(context).toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: _showAlarm,
              color: Colors.indigo,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  'hora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            // Text(
            //   _inicio == 0 ? 'finish' : _inicio.toString(),
            //   style: const TextStyle(fontSize: 30),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // MaterialButton(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   onPressed: _playing,
            //   color: Colors.indigo,
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 20,
            //       vertical: 10,
            //     ),
            //     child: Text(
            //       'start',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 30,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
