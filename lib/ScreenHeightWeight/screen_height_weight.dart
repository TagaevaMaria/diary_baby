import 'package:flutter/material.dart';

import '../main_screen/background_widget.dart';

class ScreenHeightWeight extends StatefulWidget {
  const ScreenHeightWeight({Key? key}) : super(key: key);

  @override
  _ScrenHeightWeightState createState() => _ScrenHeightWeightState();
}

class _ScrenHeightWeightState extends State<ScreenHeightWeight> {
  ///лист событий
  List _listEvent = [];

  ///элменты списка прописываются в специальном методе initState
  @override
  void initState() {
    super.initState();

    _listEvent.addAll(['рост:104, вес: 4100']);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
          title: Text('Показатели'),
        ),
        body: ListView.builder(
            itemCount: _listEvent.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(_listEvent[index]),
                child: Card(
                  child: ListTile(
                    title: Text(_listEvent[index]),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _listEvent.removeAt(index);
                  });
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Показатели'),
                    content: TextField(
                      onChanged: (String value) {
                        return;
                      },
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
