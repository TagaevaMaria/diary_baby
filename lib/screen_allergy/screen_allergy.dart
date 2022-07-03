import 'package:diary_baby/screen_allergy/screen_allergy_event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../main_screen/background_widget.dart';

class ScreenAllergy extends StatefulWidget {
  const ScreenAllergy({Key? key}) : super(key: key);

  @override
  _ScreenAllergyState createState() => _ScreenAllergyState();
}

class _ScreenAllergyState extends State<ScreenAllergy> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Пищевой календарь '),
        backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
      ),
      body: TableCalendar(
        locale: 'ru_RU',
        focusedDay: selectedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2050),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectdDay, DateTime focusDay) {
          setState(() {
            selectedDay = selectdDay;
            focusedDay = focusDay;
          });
          print(focusDay);
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(selectedDay, date);
        },
        calendarStyle: const CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration:
                BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
                color: Colors.blueAccent, shape: BoxShape.circle)),
      ),
    ));
  }
}
