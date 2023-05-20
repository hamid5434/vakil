import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData? icons;
  final String title;
  final bool isActive;
  final bool isShowBadge;
  final Function() onTab;
  final String? iconPath;

  const BottomNavigationItem({
    Key? key,
    this.icons,
    required this.title,
    required this.isActive,
    required this.onTab,
    this.isShowBadge = false,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTab,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 30,
              child: Stack(
                children: [
                  Center(
                      child: Container(
                    width: 25,
                    height: 25,
                    child: iconPath != null
                        ? Image.asset(
                            iconPath!,
                            color: isActive ? null : Theme.of(context).colorScheme.onSecondary,
                          )
                        : Icon(
                            icons,
                            color: isActive
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSecondary,
                          ),
                  )),
                ],
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSecondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
