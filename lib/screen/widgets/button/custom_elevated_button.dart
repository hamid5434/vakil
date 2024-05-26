import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderRadius,
    required this.padding,
    this.size,
    this.borderWith,
    this.color,
    this.side,
    this.focusNode,
  }) : super(key: key);
  final Widget child;
  final GestureTapCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderRadius borderRadius;
  final BorderSide? side;
  final Size? size;
  final EdgeInsets padding;
  final FocusNode? focusNode;
  final double? borderWith;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        fixedSize: MaterialStateProperty.all(size),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: borderRadius,side: side ?? BorderSide(width: borderWith ?? 0.0,color: color ?? Colors.transparent))),
        padding: MaterialStateProperty.all(padding),

      ),
      child: child,
    );
  }
}
