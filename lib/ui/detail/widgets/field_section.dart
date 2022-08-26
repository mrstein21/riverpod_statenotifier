import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_statenotifier/utils/constant.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({Key? key, required this.field, required this.value}) : super(key: key);
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field,style: const TextStyle(fontSize: 14,color: kColorWhite),),
        const SizedBox(height: kDefaultPadding/5,),
        Text(value,style: const TextStyle(
          fontSize: 12,
          color: kColorWhite
        ),)
      ],
    );
  }
}
