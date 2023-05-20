import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      this.borderRadius,
      this.prefixIcon = Icons.clear,
      this.suffixIcon = Icons.remove_red_eye,
      this.textAlign = TextAlign.right,
      this.backColor,
      this.suffixIconColor,
      this.prefixIconColor,
      this.suffixIconSize = 20,
      this.prefixIconSize = 20,
      this.callbackSuffixIcon,
      this.callbackPrefixIcon,
      this.textChange,
      this.enable = true,
      this.obscureText = false,
      required this.controller,
      this.margin,
      this.isNumber = false,
      this.padding})
      : super(key: key);

  final String hint;
  final BorderRadius? borderRadius;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextAlign textAlign;
  final Color? backColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final double suffixIconSize;
  final TextEditingController controller;
  final Function(String)? textChange;
  final double prefixIconSize;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  bool isNumber;
  final bool? enable;
  final GestureTapCallback? callbackSuffixIcon;
  final GestureTapCallback? callbackPrefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: widget.padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: widget.backColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]),
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {},
        controller: widget.controller,
        //initialValue: qty.toString(),
        enabled: widget.enable,
        //autofocus: true,
        maxLines: 1,
        minLines: 1,
        onChanged: widget.textChange ?? (value) {},
        textAlign: widget.textAlign,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: widget.isNumber
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : [],
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide.none),
          //filled: true,
          //fillColor: Colors.white,
          prefixIcon: widget.callbackPrefixIcon == null
              ? null
              : ClipRRect(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(15),
                  child: SizedBox(
                    width: 20,
                    child: TextButton(
                      onPressed: widget.callbackPrefixIcon,
                      child: Icon(
                        widget.prefixIcon,
                        color: widget.prefixIconColor ??
                            Theme.of(context).colorScheme.onSecondary,
                        size: widget.prefixIconSize,
                      ),
                    ),
                  ),
                ),
          suffixIcon: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
            child: widget.callbackSuffixIcon == null
                ? Container(
                    width: 1,
                  )
                : SizedBox(
                    width: 20,
                    child: TextButton(
                      onPressed: widget.callbackSuffixIcon,
                      child: Icon(
                        widget.suffixIcon ?? CupertinoIcons.eye,
                        color: widget.suffixIconColor ??
                            Theme.of(context).colorScheme.onSecondary,
                        size: widget.suffixIconSize,
                      ),
                    ),
                  ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(0),
        ),
        //autofocus: true,
      ),
    );
  }
}
