import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vakil_0098/common/theme.dart';
import 'package:vakil_0098/common/token.dart';
import 'package:vakil_0098/screen/widgets/button/button_setting.dart';
import '../../../common/common.dart';
import '../../../l10n/l10n.dart';

class SettingTab extends StatelessWidget {
  SettingTab({Key? key}) : super(key: key);

  List<String> languageName = ['فارسی', 'English', 'العربی'];
  int languageNameIndex = 0;

  //ValueNotifier<String> languageNotifier=ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(25),
                      child: Center(
                        child: Icon(
                          MdiIcons.exitToApp,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(25),
                      child: Center(
                        child: Icon(
                          MdiIcons.help,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            //color: Colors.yellow,
            margin:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.person_alt_circle,
                  size: 60,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(.7),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 60,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Token.resultToken!.firstName!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: LightThemeColors.surface),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.personel_id} : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                      fontSize: 11,
                                      color:
                                      LightThemeColors.surface),
                                ),
                                Text(
                                  Token.resultToken!.fullName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                      fontSize: 11,
                                      color:
                                      LightThemeColors.surface),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.pap_code} : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                      fontSize: 11,
                                      color:
                                      LightThemeColors.surface),
                                ),
                                Text(
                                  Token.resultToken!.fullName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                      fontSize: 11,
                                      color:
                                      LightThemeColors.surface),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonSetting(
            icon: Icons.mode_edit_outline_outlined,
            text: AppLocalizations.of(context)!.change_password,
            onpress: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ButtonSetting(
            icon: Icons.refresh,
            text: AppLocalizations.of(context)!.program_update,
            onpress: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.surface,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 8),
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
                    Icon(
                      Icons.language,
                      size: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Text(
                          AppLocalizations.of(context)!.language,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        width: 80,
                        height: 30,
                        padding: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: Common.localeChangeNotifier,
                          builder: (context, value, child) {
                            return Center(
                              child: DropdownButton<Locale>(
                                underline: const SizedBox(),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: LightThemeColors.surface,
                                ),
                                hint: Center(
                                  child: Text(
                                    L10N.getFlag(Common.localeChangeNotifier.value!
                                        .languageCode),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                      color: LightThemeColors.surface,
                                    ),
                                  ),
                                ),
                                items: L10N.all.map((Locale value) {
                                  return DropdownMenuItem<Locale>(
                                    value: value,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Center(
                                        child: Text(
                                          L10N.getFlag(value.languageCode),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  Common.localeChangeNotifier.value = val;
                                  Token.setlocaleApp(
                                      localeName: Common
                                          .localeChangeNotifier
                                          .value!
                                          .languageCode);
                                  print(Common.localeChangeNotifier.value!
                                      .languageCode);
                                },
                              ),
                            );
                          },
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
