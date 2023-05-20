import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:vakil_0098/screen/home/tabs/tab.dart';

import 'home_screen.dart';
import 'widgets/botton_navigator.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

const int TASKINDEX = 0;
const int NOTIFICATININDEX = 1;
const int HOMEINDEX = 2;
const int EDUCATIONINDEX = 3;
const int SETTINGINDEX = 4;

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = HOMEINDEX;

  List<int> _history = [];

  late StreamSubscription<bool> keyboardSubscription;

  //bool visible = true;

  ValueNotifier<bool> visibleBottomBar = ValueNotifier(false);

  final GlobalKey<NavigatorState> _taskKey = GlobalKey();
  final GlobalKey<NavigatorState> _notificationKey = GlobalKey();
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _educationKey = GlobalKey();
  final GlobalKey<NavigatorState> _settingKey = GlobalKey();

  late final map = {
    HOMEINDEX: _homeKey,
    TASKINDEX: _taskKey,
    NOTIFICATININDEX: _notificationKey,
    EDUCATIONINDEX: _educationKey,
    SETTINGINDEX: _settingKey,
  };


  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
     this.visibleBottomBar.value = visible;
    });

  }

  Future<bool> onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body:
        ValueListenableBuilder(
            builder: (context, value, child) {
              print('############${visibleBottomBar.value}##############');
              return Stack(
                children: [
                  Positioned.fill(
                    bottom: visibleBottomBar.value ? 0 : 55,
                    child: IndexedStack(
                      index: selectedScreenIndex,
                      children: [
                        Navigator(
                          key: _taskKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => TaskTab(),
                          ),
                        ),
                        Navigator(
                          key: _notificationKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => NotificationTab(),
                          ),
                        ),
                        Navigator(
                          key: _homeKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        ),
                        Navigator(
                          key: _educationKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => EducationTab(),
                          ),
                        ),
                        Navigator(
                          key: _settingKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => SettingTab(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: visibleBottomBar.value ? -60 : 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.blue,
                      child: BottomNavigation(
                        onTab: (int index) {
                          setState(() {
                            _history.remove(selectedScreenIndex);
                            _history.add(selectedScreenIndex);
                            selectedScreenIndex = index;
                          });
                        },
                        selectIndex: selectedScreenIndex,
                      ),
                    ),
                  )
                ],
              );
            },
            valueListenable: visibleBottomBar ),

      ),
    );
  }
}
