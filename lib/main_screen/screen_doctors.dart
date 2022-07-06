import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Экран записи к доктору.
class ScreenDoctors extends StatefulWidget {
  const ScreenDoctors({Key? key}) : super(key: key);

  @override
  State<ScreenDoctors> createState() => _ScreenDoctorsState();
}

class _ScreenDoctorsState extends State<ScreenDoctors> {
  TextEditingController _eventController = TextEditingController();

  ///контрол для ввода текста
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Color.fromRGBO(165, 218, 249, 1)),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Информация о приеме'),
              content: TextFormField(
                controller: _eventController,
              ),
              actions: [
                TextButton(
                  child: Text('ок'),
                  onPressed: () {
                    Navigator.pop(context);
                    _eventController.clear();
                  },

                  ///закрытие маршрута
                ),
              ],
            ),
          ),
          child: const Text(
            'Добавить врача',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
