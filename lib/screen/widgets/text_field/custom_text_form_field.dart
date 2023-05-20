import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vakil_0098/common/theme.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      this.borderRadius,
      this.prefixIcon = Icons.clear,
      this.suffixIcon,
      this.textAlign = TextAlign.right,
      this.backColor,
      this.suffixIconColor,
      this.prefixIconColor,
      this.suffixIconSize = 20,
      required this.controller,
      this.textChange,
      this.validator,
      this.prefixIconSize = 20,
      this.callbackSuffixIcon,
        this.enable = true,
      this.callbackPrefixIcon})
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
  final String? Function(String?)? validator;
  final double prefixIconSize;
  final GestureTapCallback? callbackSuffixIcon;
  final GestureTapCallback? callbackPrefixIcon;
  final bool enable;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        validator: widget.validator,
        controller: widget.controller,
        enabled: widget.enable,
        maxLines: 1,
        minLines: 1,
        onChanged: widget.textChange ?? (value) {},
        textAlign: widget.textAlign,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15.0),
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15.0),
            borderSide: BorderSide(color: DarkThemeColors.colorTitle),
          ),
          errorStyle: TextStyle(color: theme.primaryColor),
          filled: true,
          fillColor: theme.colorScheme.surface,
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
            color: theme.hintColor,
          ),
          prefixIcon: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
            child: widget.callbackPrefixIcon == null
                ? Container(
                    width: 1,
                  )
                : SizedBox(
                    width: 20,
                    child: TextButton(
                      onPressed: widget.callbackPrefixIcon,
                      child: Icon(
                        widget.prefixIcon,
                        color: widget.prefixIconColor ??
                            theme.colorScheme.onSurface,
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
                            theme.colorScheme.onSurface,
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
