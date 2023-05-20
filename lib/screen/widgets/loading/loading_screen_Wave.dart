import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenWave extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingScreenWave({
    Key? key,
    this.size = 40,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: color,
        size: size,
      ),
    );
  }
}
