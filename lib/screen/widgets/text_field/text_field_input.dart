import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput(
      {Key? key,
      required this.hint,
      this.borderRadius,
      this.textAlign = TextAlign.right,
      this.backColor,
      this.textChange,
      required this.controller,
      required this.isNumber,
      this.focus,
      })
      : super(key: key);

  final String hint;
  final BorderRadius? borderRadius;
  final TextAlign textAlign;
  final Color? backColor;
  final TextEditingController controller;
  final Function(String)? textChange;
  final bool isNumber;
  final FocusNode? focus;


  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 4),
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
        enabled: true,
        //autofocus: true,
        focusNode: widget.focus,
        maxLines: 1,
        minLines: 1,
        onChanged: widget.textChange ?? (value) {},
        textAlign: widget.textAlign,
        keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: widget.isNumber ?  <TextInputFormatter> [
           FilteringTextInputFormatter.digitsOnly
        ] : [],
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSecondary,
        ),

        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 16,
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
          suffixIcon: Container(
            width: 1,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),

        ),
        //autofocus: true,
      ),
    );
  }
}
