import 'package:covi_tracker/constants.dart';
import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
   HomeText({ Key? key, required this.head,required this.body}) : super(key: key);

  final String head;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(head,style: headText,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(body,style: bodyText,),
        )
      ],
    );
  }
}