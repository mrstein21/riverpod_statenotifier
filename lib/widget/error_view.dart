import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_statenotifier/utils/constant.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            color: kColorDark,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error,color: kColorWhite,size: 50,),
                SizedBox(height: kDefaultPadding/2,),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorWhite,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
