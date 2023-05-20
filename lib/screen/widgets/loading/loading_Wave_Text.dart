import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingWaveText extends StatelessWidget {
  final String message;

  final Color? color;
  final double fontsizeText;
  final double sizeIcon;

  const LoadingWaveText(
      {this.message = 'لطفا صبر کنید...',
      this.color,
      this.fontsizeText = 14,
      this.sizeIcon = 14})
      : super();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitThreeBounce(
          color: color == null ? Theme.of(context).primaryColor : color!,
          size: sizeIcon,
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: color == null ? Theme.of(context).primaryColor : color!,
                fontSize: fontsizeText,
              ),
        ),
      ],
    ));
  }
}
