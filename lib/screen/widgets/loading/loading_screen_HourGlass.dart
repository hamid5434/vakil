import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenHourGlass extends StatelessWidget {
  final double size;
  final Color loadcolor;

  const LoadingScreenHourGlass({
    Key? key,
    this.size = 50,
    this.loadcolor = Colors.indigo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitHourGlass(
        color: loadcolor,
        size: size,
      ),
    );
  }
}
