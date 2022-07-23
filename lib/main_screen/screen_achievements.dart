import 'package:diary_baby/main_screen/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenAchievements extends StatefulWidget {
  const ScreenAchievements({Key? key}) : super(key: key);

  @override
  _ScreenAchievementsState createState() => _ScreenAchievementsState();
}

class _ScreenAchievementsState extends State<ScreenAchievements> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(165, 218, 249, 1),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Image(
              image: AssetImage('image/chart.jpeg'),
            ),
            TextButton(
              onPressed: () => _datePicker(context),
              child: const Text(
                'Улыбка',
                style: TextStyle(fontSize: 25),
              ),
            ),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Гуление',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Целенаправленные движения руками',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Перевeрнулся',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Сидит',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Ползает',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Встает',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Ходит с поддержкой',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Стоит',
                  style: TextStyle(fontSize: 25),
                )),
            TextButton(
                onPressed: () => _datePicker(context),
                child: const Text(
                  'Самостоятельно ходит',
                  style: TextStyle(fontSize: 25),
                )),
          ]),
        ),
      ),
    );
  }

  final DataTime = DateTime(2018, 12, 29);
  final _newDate = DateTime.now();

  /// final difference = daysBetween(DataTime, _newDate);

  void _datePicker(BuildContext screenContext) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            backgroundColor: Colors.blueAccent,
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: (DateTime _newDate) {},
          ),
        ),
      ),
    );

    /*
    1) Получить дату рождения
    2) Получить выбрвнную дату
    3) Расчет возраста

    ----------------------------------
    1) Записывать в память модель ребенка
       - Имя
       - Дата рождения
       - Пол
       - Достижения
       - Аллергии


     2) Управление состоянием
      - Запиcь
      - Чтение

     - Repository - Отправка/ получение данных
          |
     - Service - Обработка данных
          |
       Управление состояние
          |
          UI

     3) DB sqlFlite - ,база данных
     */
  }
}

/// таблица ввода данных
Widget _myContainers({
  required double height,
  required double width,
}) {
  return Container(
    height: 32,
    width: 205.5,
  );
}

/// мои переменные:
const _mySt = TextStyle(
  fontSize: 25,
  color: Colors.black26,
  fontWeight: FontWeight.w600,
);

final _myTextField = TextField(
    style: TextStyle(color: Colors.indigo, fontSize: 30),
    decoration: InputDecoration(border: OutlineInputBorder()));
