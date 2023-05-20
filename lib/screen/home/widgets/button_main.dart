import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
  ButtonMain(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.callback})
      : super(key: key);

  final String title;
  final String imagePath;
  final GestureTapCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 20,
            right: 15,
            child: Container(
              width: 100,
              height: 2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.3),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
              ),
            ),
            child: Material(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: callback,
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      imagePath,
                      height: 40,
                      width: 40,
                    ),
                    Expanded(
                        child: Center(
                            child: Text(title,
                                style: Theme.of(context).textTheme.headline6))),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
