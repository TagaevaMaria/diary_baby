import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'background_widget.dart';
import 'package:intl/intl.dart';

class ScreenAllergy extends StatefulWidget {
  const ScreenAllergy({Key? key}) : super(key: key);

  @override
  _ScreenAllergyState createState() => _ScreenAllergyState();
}

class _ScreenAllergyState extends State<ScreenAllergy> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
            ),
            body: TableCalendar(
              locale: 'ru_RU',
              firstDay: DateTime(2022, 07, 01),
              lastDay: DateTime(2040, 07, 02),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
            )));
  }
}
