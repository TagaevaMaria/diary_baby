import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_screen/main_screen_widget.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

/// авторизация
class _AuthorizationState extends State<Authorization> {
  final _autNameController = TextEditingController(text: 'Ромаха');
  final _autDataController = TextEditingController(text: '29.12.2018');
  final _autPolController = TextEditingController(text: 'Мальчик');

  void _autNext() {
    final name = _autNameController.text;
    final data = _autDataController.text;
    final pol = _autPolController.text;
    if (name == 'Ромаха' && data == '29.12.2018' && pol == 'Мальчик') {
      Navigator.of(context).pushNamed('/main_screen');
      MaterialPageRoute<void>(builder: (context) => MainScreenWidget());
    } else {
      print('show error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(165, 218, 249, 1),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                const Text(
                  'Имя малыша',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: _autNameController,
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                const Text(
                  'Дата рождения',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: _autDataController,
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                const Text(
                  'Мальчик/девочка',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: _autPolController,
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                TextButton(
                  onPressed: _autNext,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(top: 50, left: 250))),
                  child: const Text(
                    'Вперед',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
