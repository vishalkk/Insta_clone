import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Function()? function;
  const FollowButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
              )),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 220,
          height: 30,
        ),
      ),
    );
  }
}
