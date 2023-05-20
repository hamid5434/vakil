import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vakil_0098/screen/widgets/loading/loading_screen_fading_circle.dart';

class SearchTextFieldRtl extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final void Function(String) onSearch;
  final void Function(String) onChange;
  final Function? onRemove;
  final bool isLoading;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final bool? hasSuffixIcon;
  final FormFieldValidator validator;
  final Color? fillColor;
  final bool removeFilter;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final bool isEnable;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final double? iconHeight;

  const SearchTextFieldRtl(
      {Key? key,
      this.hintText,
      required this.onSearch,
      required this.controller,
      required this.onChange,
      this.maxLength,
      this.keyboardType,
      this.inputFormatters,
      this.suffixText,
      this.hasSuffixIcon = true,
      required this.isLoading,
      required this.isEnable,
      required this.validator,
      this.fillColor,
      this.onRemove,
      this.removeFilter = false,
      this.textDirection = TextDirection.rtl,
      this.textAlign = TextAlign.right,
      this.focusNode,
      this.contentPadding,
      this.iconHeight})
      : super(key: key);

  @override
  _SearchTextFieldRtlState createState() => _SearchTextFieldRtlState();
}

class _SearchTextFieldRtlState extends State<SearchTextFieldRtl> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Theme.of(context).primaryColor,
            ),
      ),
      child: Directionality(
        textDirection: widget.textDirection,
        child: TextFormField(
          textAlign: widget.textAlign,
          onChanged: (widget.onChange != null)
              ? (value) {
                  widget.onChange(value);
                }
              : null,
          enabled: widget.isEnable || (widget.isLoading) ? false : true,
          maxLength: widget.maxLength,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          focusNode: widget.focusNode,
          onFieldSubmitted: (value) {
            if (!widget.removeFilter) {
              FocusScope.of(context).requestFocus();
              widget.onSearch(value);
              FocusScope.of(context).unfocus();
            }
          },
          keyboardType: widget.keyboardType,
          textInputAction: (widget.removeFilter)
              ? TextInputAction.done
              : TextInputAction.search,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: (widget.fillColor != null) ? true : false,
            fillColor: widget.fillColor,
            counterText: "",
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),
            suffixText: widget.suffixText,
            suffixIconConstraints: widget.iconHeight != null
                ? BoxConstraints(
                    maxWidth: (widget.iconHeight!) + 5, maxHeight:( widget.iconHeight!) +5)
                : null,
            suffixIcon: (widget.hasSuffixIcon!)
                ? (widget.isLoading)
                    ? Container(
                        constraints: widget.iconHeight == null
                            ? const BoxConstraints(maxWidth: 40, maxHeight: 40)
                            : BoxConstraints(
                                maxWidth: widget.iconHeight!,
                                maxHeight: widget.iconHeight!),
                        child: LoadingScreenFadingCircle(
                          size: widget.iconHeight ?? 40,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : (widget.removeFilter)
                        ? IconButton(
                            icon: Icon(
                              Icons.close,
                              size: widget.iconHeight ?? 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              FocusScope.of(context).requestFocus();
                              widget.onRemove!();
                              FocusScope.of(context).unfocus();
                            },
                          )
                        : widget.iconHeight == null
                            ? IconButton(
                                icon: Icon(
                                  Icons.search_outlined,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).requestFocus();
                                  widget.onSearch(widget.controller.text);
                                  FocusScope.of(context).unfocus();
                                },
                              )
                            : InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                  child: Icon(
                                    Icons.search_outlined,
                                    size: widget.iconHeight!,
                                    color:
                                        Theme.of(context).colorScheme.onSecondary,
                                  ),
                                ),
                                onTap: () {
                                  FocusScope.of(context).requestFocus();
                                  widget.onSearch(widget.controller.text);
                                  FocusScope.of(context).unfocus();
                                },
                              )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
