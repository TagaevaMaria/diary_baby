import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Экран записи к доктору.
class ScreenDoctors extends StatefulWidget {
  const ScreenDoctors({Key? key}) : super(key: key);

  @override
  State<ScreenDoctors> createState() => _ScreenDoctorsState();
}

class _ScreenDoctorsState extends State<ScreenDoctors> {
  late String _userText;
  List listDoctors = [];
  @override
  void initState() {
    super.initState();
    listDoctors.addAll(['Аллерголог', 'Невролог', 'Педиатр']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: const Color.fromRGBO(165, 218, 249, 1)),
      body: ListView.builder(
          itemCount: listDoctors.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(listDoctors[index]),
              child: Card(
                child: ListTile(
                  title: Text(listDoctors[index]),
                ),
              ),
              onDismissed: (directional) {
                setState(() {
                  listDoctors.removeAt((index));
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Добавить прием врача'),
                    content: TextField(
                      onChanged: (String value) {
                        _userText = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              listDoctors.add(_userText);
                              Navigator.of(context).pop();
                            });
                          },
                          child: const Text('ok'))
                    ],
                  );
                });
          },
          child: const Icon(
            Icons.add_circle_outline,
            size: 50,
          )),
    );
  }
}
