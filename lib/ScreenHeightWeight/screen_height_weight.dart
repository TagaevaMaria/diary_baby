import 'package:flutter/material.dart';

import '../main_screen/background_widget.dart';

class ScreenHeightWeight extends StatefulWidget {
  const ScreenHeightWeight({Key? key}) : super(key: key);

  @override
  _ScrenHeightWeightState createState() => _ScrenHeightWeightState();
}

class _ScrenHeightWeightState extends State<ScreenHeightWeight> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(165, 218, 249, 1),
        title: const Text('Показатели'),
      ),

      /// кнопки вес и рост
      body: _rowWidgets(
        title: 'вес',
        titleTwo: 'рост',
        image: 'image/image_screen_ height_weight/weight.png',
        imageTwo: 'image/image_screen_ height_weight/height.png',
        size: 80.0,
        paddingOne:
            const EdgeInsets.only(top: 50, bottom: 20, left: 10, right: 10),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        onPressed: () {
          Navigator.of(context).pushNamed('/indicator_calendar_weight');
        },
        onPressedTwo: () {},
        paddingTwy:
            const EdgeInsets.only(top: 50, bottom: 20, left: 10, right: 10),
      ),
    ));
  }
}

/// Ряд виджетов.
Widget _rowWidgets({
  required String title,
  required String titleTwo,
  required String image,
  required String imageTwo,
  required double size,
  required EdgeInsets paddingOne,
  required EdgeInsets paddingTwy,
  required MainAxisAlignment mainAxisAlignment,
  required CrossAxisAlignment crossAxisAlignment,
  required Function() onPressed,
  required Function() onPressedTwo,
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    children: [
      _circleButtonWidget(
        title: title,
        image: image,
        size: size,
        padding: paddingOne,
        onPressed: onPressed,
      ),
      _circleButtonWidget(
        title: titleTwo,
        image: imageTwo,
        size: size,
        padding: paddingTwy,
        onPressed: onPressedTwo,
      ),
    ],
  );
}

/// Виджет кнопки выбора действия.
Widget _circleButtonWidget({
  required String title,
  required String image,
  required double size,
  required EdgeInsets padding,
  required Function() onPressed,
}) {
  return Column(
    children: [
      TextButton(
        onPressed: onPressed,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 20, left: 10, right: 10),
          child: Image(
            image: AssetImage(image),
            width: size,
            height: size,
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      )
    ],
  );
}
