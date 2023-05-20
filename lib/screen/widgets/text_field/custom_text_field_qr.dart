import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldQr extends StatefulWidget {
  const CustomTextFieldQr(
      {Key? key,
      required this.hint,
      this.borderRadius,
      this.prefixIcon = Icons.clear,
      this.suffixIcon = Icons.remove_red_eye,
      this.suffixIcon1 = CupertinoIcons.barcode_viewfinder,
      this.textAlign = TextAlign.right,
      this.backColor,
      this.suffixIconColor,
      this.prefixIconColor,
      this.suffixIconSize = 20,
      this.suffixIconSize1 = 20,
      this.prefixIconSize = 20,
      this.callbackSuffixIcon,
      this.callbackPrefixIcon,
      this.callbackSuffixIcon1,
      this.textChange,
      required this.controller})
      : super(key: key);

  final String hint;
  final BorderRadius? borderRadius;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final IconData? suffixIcon1;
  final TextAlign textAlign;
  final Color? backColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final double suffixIconSize;
  final double suffixIconSize1;
  final TextEditingController controller;
  final Function(String)? textChange;
  final double prefixIconSize;

  final GestureTapCallback? callbackSuffixIcon;
  final GestureTapCallback? callbackSuffixIcon1;
  final GestureTapCallback? callbackPrefixIcon;

  @override
  State<CustomTextFieldQr> createState() => _CustomTextFieldQrState();
}

class _CustomTextFieldQrState extends State<CustomTextFieldQr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: widget.backColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
          //border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              child: widget.callbackPrefixIcon == null
                  ? Container(
                width: 1,
              )
                  : SizedBox(
                width: 45,
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
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {},
              controller: widget.controller,
              //initialValue: qty.toString(),
              enabled: true,
              //autofocus: true,
              maxLines: 1,
              minLines: 1,
              onChanged: widget.textChange ?? (value) {},
              textAlign: widget.textAlign,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
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
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
              ),
              //autofocus: true,
            ),
          ),
          InkWell(
            child: ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              child: widget.callbackSuffixIcon == null
                  ? Container(
                width: 1,
              )
                  : SizedBox(
                width: 40,
                child: TextButton(
                  onPressed: widget.callbackSuffixIcon1,
                  child: Icon(
                    widget.suffixIcon1 ?? CupertinoIcons.barcode_viewfinder,
                    color: widget.suffixIconColor ??
                        Theme.of(context).colorScheme.onSecondary,
                    size: widget.suffixIconSize1,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            child:  ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              child: widget.callbackSuffixIcon == null
                  ? Container(
                width: 1,
              )
                  : SizedBox(
                width: 45,
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
          ),
        ],
      ),
    );
  }
}
