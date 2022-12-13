import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}