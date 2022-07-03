import 'package:flutter/material.dart';
import 'background_widget.dart';

class ScreenPhoto extends StatefulWidget {
  const ScreenPhoto({Key? key}) : super(key: key);

  @override
  _ScreenPhotoState createState() => _ScreenPhotoState();
}

class _ScreenPhotoState extends State<ScreenPhoto> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'Альбомы по месяцам',
            ),
            backgroundColor: Color.fromRGBO(165, 218, 249, 1),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                _rowButtonAgeFhoto(
                    imageOne: 'image/image_fhoto_age/one.png',
                    imageTwo: 'image/image_fhoto_age/two.png',
                    imageThree: 'image/image_fhoto_age/three.png',
                    onPressed: () {}),
                Column(
                  children: [
                    _rowButtonAgeFhoto(
                        imageOne: 'image/image_fhoto_age/four.png',
                        imageTwo: 'image/image_fhoto_age/five.png',
                        imageThree: 'image/image_fhoto_age/six.png',
                        onPressed: () {}),
                    Column(
                      children: [
                        _rowButtonAgeFhoto(
                            imageOne: 'image/image_fhoto_age/seven.png',
                            imageTwo: 'image/image_fhoto_age/eight.png',
                            imageThree: 'image/image_fhoto_age/nine.png',
                            onPressed: () {}),
                        _rowButtonAgeFhoto(
                            imageOne: 'image/image_fhoto_age/ten.png',
                            imageTwo: 'image/image_fhoto_age/eleven.png',
                            imageThree: 'image/image_fhoto_age/twelve.png',
                            onPressed: () {})
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  /// виджет кнопки выбора возроста для фото
  Widget _rowButtonAgeFhoto({
    required String imageOne,
    required String imageTwo,
    required String imageThree,
    required Function onPressed,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              imageOne,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              imageTwo,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              imageThree,
              width: 100,
              height: 100,
            ),
          ),
        )
      ],
    );
  }
}
