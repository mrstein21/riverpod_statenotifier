import 'package:flutter/material.dart';
import '../../../utils/constant.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kColorBlack,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: kColorWhite,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            name,style: const TextStyle(
            fontSize: 16,
            color: kColorWhite
          ),
            maxLines: 1,
          )
        ]),
      ),
    );
  }
}
