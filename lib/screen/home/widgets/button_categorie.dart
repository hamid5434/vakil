import 'package:flutter/material.dart';

class ButtonCategorie extends StatelessWidget {
  ButtonCategorie(
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
    return Container(
      width: 80,
      height: 90,
      margin: const EdgeInsets.only(left: 4,right: 4,top: 4,bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(.08),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: callback,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 45,
                width: 45,
              ),
              Container(
                  width: 75,
                  height: 40,
                  //color: Colors.yellow,
                  child: Center(
                      child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                     fontSize: 12,
                    ),
                  ),),),
            ],
          ),
        ),
      ),
    );
  }
}
