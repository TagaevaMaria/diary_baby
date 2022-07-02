import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(165, 218, 249, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _rowWidgets(
              title: 'Достижения',
              titleTwo: 'Запись к врачам',
              titleThree: 'Заметки',
              image: 'image/achievements.png',
              imageTwo: 'image/doctors.png',
              imageThree: 'image/notes.png',
              size: 80.0,
              padding: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 10, right: 10),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/screen_achievements',
                );
              },
              onPressedTwo: () {
                Navigator.of(context).pushNamed(
                  '/screen_doctors',
                );
              },
            ),
            _rowWidgets(
              title: 'Фотографии',
              titleTwo: 'Аллергии',
              titleThree: 'Рост и вес',
              image: 'image/foto.png',
              imageTwo: 'image/allergy.png',
              imageThree: 'image/height_weight.png',
              size: 80.0,
              padding: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 10, right: 10),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/screen_photo',
                );
              },
              onPressedTwo: () {
                Navigator.of(context).pushNamed('/screen_allergy');
              },
            ),
            _rowWidgets(
              title: 'Прививки',
              titleTwo: 'Cон',
              titleThree: 'Прикорм',
              image: 'image/vaccinations.png',
              imageTwo: 'image/night.png',
              imageThree: 'image/eat.png',
              size: 80.0,
              padding: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 10, right: 10),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              onPressed: () {},
              onPressedTwo: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// Ряд виджетов.
  Widget _rowWidgets({
    required String title,
    required String titleTwo,
    required String titleThree,
    required String image,
    required String imageTwo,
    required String imageThree,
    required double size,
    required EdgeInsets padding,
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
          padding: padding,
          onPressed: onPressed,
        ),
        _circleButtonWidget(
          title: titleTwo,
          image: imageTwo,
          size: size,
          padding: padding,
          onPressed: onPressedTwo,
        ),
        _circleButtonWidget(
          title: titleThree,
          image: imageThree,
          size: size,
          padding: padding,
          onPressed: () {},
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
          child: Image(
            image: AssetImage(image),
            width: size,
            height: size,
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
}
