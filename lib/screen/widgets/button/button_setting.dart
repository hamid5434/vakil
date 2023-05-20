import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonSetting extends StatelessWidget {
  final String text;
  final double textSize;
  final GestureTapCallback? onpress;
  final IconData icon;
  final IconData arrowicon;

  const ButtonSetting({
    Key? key,
    this.text = 'Button',
    this.textSize = 14,
    this.onpress,
    this.icon = MdiIcons.accountEditOutline,
    this.arrowicon = MdiIcons.chevronLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: onpress,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 12,
                ),
                Icon(icon, size: 22,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Icon(arrowicon,
                    size: 25, color: Theme.of(context).colorScheme.secondaryContainer,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
