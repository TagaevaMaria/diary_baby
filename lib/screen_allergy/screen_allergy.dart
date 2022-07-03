import 'package:diary_baby/screen_allergy/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../main_screen/background_widget.dart';

class ScreenAllergy extends StatefulWidget {
  const ScreenAllergy({Key? key}) : super(key: key);

  @override
  _ScreenAllergyState createState() => _ScreenAllergyState();
}

class _ScreenAllergyState extends State<ScreenAllergy> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _eventcontroller = TextEditingController();
  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Пищевой календарь '),
          backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
        ),
        body: Column(
          children: [
            TableCalendar(
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
              eventLoader: _getEventsfromDay,

              /// стиль календаря
              calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Colors.pinkAccent, shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle)),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(event.title),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Добавить событие'),
              content: TextFormField(
                controller: _eventcontroller,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('закрыть')),
                TextButton(
                  child: Text('ok'),
                  onPressed: () {
                    if (_eventcontroller.text.isEmpty) {
                    } else {
                      if (selectedEvents[selectedDay] != null) {
                        selectedEvents[selectedDay]?.add(
                          Event(title: _eventcontroller.text),
                        );
                      } else {
                        selectedEvents[selectedDay] = [
                          Event(title: _eventcontroller.text)
                        ];
                      }
                    }
                    Navigator.pop(context);
                    _eventcontroller.clear();
                    setState(() {});
                    return;
                  },
                ),
              ],
            ),
          ),
          label: const Text('добавить событие'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
