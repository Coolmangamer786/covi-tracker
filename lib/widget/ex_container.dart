import 'package:covi_tracker/constants.dart';
import 'package:flutter/material.dart';

class ExContainer extends StatelessWidget {
  ExContainer(
      {Key? key,
      required this.title,
      required this.cases,
      required this.color,
      required this.ex,
      required this.descp,
      required this.stordis})
      : super(key: key);
  final String title;
  final String cases;
  final Color color;
final bool ex;
  final String descp;
  final String stordis;

  @override
  Widget build(BuildContext context) {
  String extra=ex==true?'Cases ':'';

    double h = MediaQuery.of(context).size.height;


    if (cases == '0') {
      return Container();
    } else {
      return GestureDetector(
        child: Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Container(
              height: h < 690 ? h * .1 : 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color.withOpacity(.2),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$title : ',
                    style: widgetText.copyWith(
                        color: color, fontSize: h < 550 ? 18 : 20),
                  ),
                  Text(
                    cases,
                    style: widgetText.copyWith(
                        color: color, fontSize: h < 550 ? 18 : 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () => Navigator.pop(
                            context,
                          ),
                      child: Text('Ok I will take safety measures 😷')),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text('$title $extra:'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Currently $title ${extra}in $stordis are : -'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      cases.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Text(
                    descp,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          });
        },
      );
    }
  }
}
