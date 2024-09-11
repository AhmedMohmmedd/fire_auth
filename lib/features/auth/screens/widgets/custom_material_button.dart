
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, this.onPressed, required this.text, this.color,
  });
final void Function()? onPressed;
final String text;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color?? Theme.of(context).primaryColor,
      minWidth: double.infinity,
      height: 55,
      elevation: 0,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20 ,fontWeight: FontWeight.w600,color: Colors.black),
      ),
    );
  }
}
