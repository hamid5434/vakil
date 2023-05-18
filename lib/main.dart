import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vakil_0098/l10n/l10n.dart';
import 'package:vakil_0098/screen/home_screen.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common/common.dart';
import 'common/theme.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Common().getlocaleApp();
  await Common().getTheme();

  AssetPicker.registerObserve();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Common.themeChangeNotifier,
      builder: (context, value, child) {
        return ValueListenableBuilder(
          valueListenable: Common.localeChangeNotifier,
          builder: (context, value, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: MultiRepositoryProvider(
                providers: [

                ],
                child: MultiBlocProvider(
                  providers: [
                  ],
                  child: MaterialApp(
                    //showPerformanceOverlay: true,
                    locale: Common.localeChangeNotifier.value,
                    supportedLocales: L10N.all,
                    navigatorKey: navigatorKey,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    title: 'OK',
                    theme: theme(themeType: Common.themeChangeNotifier.value),
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen(),
                    //onGenerateRoute: AppRouter.onGenerateRoute,
                    // initialRoute: AppName.DEFUALT,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
