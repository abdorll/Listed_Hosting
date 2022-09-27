// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lister_hosting/utils/color.dart';
import 'package:lister_hosting/widgets/texts.dart';

class MajorButton extends StatelessWidget {
  MajorButton({
    required this.text,
    required this.onTap,
    required this.enabled,
    Key? key,
  }) : super(key: key);
  String text;
  Function onTap;
  bool enabled;
  @override
  Widget build(BuildContext context) {
    return enabled == true
        ? InkWell(
            onTap: () {
              onTap();
            },
            child: btn(text, enabled),
          )
        : btn(text, enabled);
  }
}

SizedBox btn(String text, bool enabled) {
  return SizedBox(
    height: 45,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: enabled == true ? orange1 : ash2,
          borderRadius: BorderRadius.circular(10)),
      child: Center(child: TextOf(text, 16, white, FontWeight.w500)),
    ),
  );
}
