import 'package:assignment/core/constants/color_constants.dart';
import 'package:assignment/core/helper/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  const MyButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16)),
          backgroundColor:
              MaterialStateProperty.all(ColorConstants.primaryColor)),
      onPressed: onPress,
      child: Center(
        child: Text(
          text,
          style: Utils.boldTextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
