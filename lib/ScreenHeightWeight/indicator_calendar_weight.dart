import 'package:diary_baby/screen_allergy/calendar_allergy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../main_screen/background_widget.dart';

class IndicatorCalendarWeight extends StatefulWidget {
  const IndicatorCalendarWeight({Key? key}) : super(key: key);

  @override
  _IndicatorCalendarState createState() => _IndicatorCalendarState();
}

class _IndicatorCalendarState extends State<IndicatorCalendarWeight> {
  int _selectedValue = 0;

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

  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(165, 218, 249, 1),
          title: Text('Показатели роста и веса'),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            CalendarAllergy(),

            ///мой календарь
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(event.title),
              ),
            ),
            SizedBox(height: 150),
            FloatingActionButton.extended(
              onPressed: () => _showPicker(context),

              ///тут делаю открытие прокрутки выбора данных
              label: Text('Добавить событие'),
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

int _selectedValue = 0;
void _showPicker(BuildContext ctx) {
  showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
            width: 300,
            height: 250,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 30,
              scrollController: FixedExtentScrollController(initialItem: 1),
              onSelectedItemChanged: (int value) {
                _selectedValue;
              },
              children: const [
                Text('0'),
                Text('1'),
                Text('2'),
              ],
            ),
          ));
}
