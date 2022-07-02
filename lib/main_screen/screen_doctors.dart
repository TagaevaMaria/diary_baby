import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Экран записи к доктору.
class ScreenDoctors extends StatefulWidget {
  const ScreenDoctors({Key? key}) : super(key: key);

  @override
  State<ScreenDoctors> createState() => _ScreenDoctorsState();
}

class _ScreenDoctorsState extends State<ScreenDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: const Color.fromRGBO(165, 218, 249, 1)),
        body: TextButton(
          onPressed: () {},
          child: const Text(
            'Добавить посещение врача',
            style: TextStyle(fontSize: 30),
          ),
          style: ButtonStyle(),
        ));
  }
}
