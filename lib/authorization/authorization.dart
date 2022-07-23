import 'package:diary_baby/main_screen/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_screen/main_screen_widget.dart';

/// стиль TextField
const _styleTextFiled = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

/// авторизация
class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

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
    return BackgroundWidget(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
            title: const Center(
              child: Text(
                'Регистрация',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Имя малыша',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                      controller: _autNameController,
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                      textAlign: TextAlign.center,
                      decoration: _styleTextFiled),
                  const Text(
                    'Дата рождения',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: _autDataController,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                    ),
                    textAlign: TextAlign.center,
                    decoration: _styleTextFiled,
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
                    decoration: _styleTextFiled,
                  ),
                  SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _autNext,
                        child: const Text(
                          'Вперед',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
