import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vakil_0098/screen/home/root_screen.dart';

import 'botton_navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.onTab,
    required this.selectIndex,
  }) : super(key: key);
  final Function(int index) onTab;

  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x009b8487).withOpacity(.3),
                    blurRadius: 20,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    onTab: () {
                      onTab(TASKINDEX);
                    },
                    isActive: selectIndex == TASKINDEX,
                    title: 'وظایف',
                    icons: selectIndex == TASKINDEX
                        ? Icons.engineering_outlined
                        : Icons.manage_accounts_outlined,
                  ),
                  BottomNavigationItem(
                    onTab: () {
                      onTab(NOTIFICATININDEX);
                    },
                    isActive: selectIndex == NOTIFICATININDEX,
                    title: 'پیام ها',
                    icons: selectIndex == NOTIFICATININDEX
                        ? Icons.chat_outlined
                        : Icons.messenger_outline,
                    isShowBadge: true,
                  ),
                  BottomNavigationItem(
                    onTab: () {
                      onTab(HOMEINDEX);
                    },
                    isActive: selectIndex == HOMEINDEX,
                    title: 'افق کوروش',
                    iconPath: 'assets/images/ic_launcher.png',
                  ),
                  BottomNavigationItem(
                    onTab: () {
                      onTab(EDUCATIONINDEX);
                    },
                    title: 'آموزش',
                    isActive: selectIndex == EDUCATIONINDEX,
                    icons: selectIndex == EDUCATIONINDEX
                        ? Icons.school
                        : Icons.school_outlined,
                  ),
                  BottomNavigationItem(
                    onTab: () {
                      onTab(SETTINGINDEX);
                    },
                    title: 'تنظیمات',
                    isActive: selectIndex == SETTINGINDEX,
                    icons: selectIndex == SETTINGINDEX
                        ? Icons.settings_suggest_outlined
                        : Icons.settings_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
