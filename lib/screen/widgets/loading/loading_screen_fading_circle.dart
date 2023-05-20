import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vakil_0098/common/theme.dart';

class LoadingScreenFadingCircle extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingScreenFadingCircle({
    Key? key,
    this.size = 50,
    this.color = kPrimaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  SpinKitFadingCircle(
        color: color,
        size: size,
      ),
    );
  }
}
