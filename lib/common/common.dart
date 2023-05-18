import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vakil_0098/common/token.dart';
import 'package:vakil_0098/main.dart';


class Common {
  static final ValueNotifier<Locale?> localeChangeNotifier =
      ValueNotifier(const Locale("en", "US"));
  static final ValueNotifier<String> themeChangeNotifier =
      ValueNotifier('light');

  static const String dirMain = 'storage/emulated/0/SuperApp';
  static const String dirPdfLoadWareHouse = 'pdf';
  static const String dirImgLoadWareHouse = 'img';
  static const String dirDownload = 'storage/emulated/0/Download';
  static const double imgHeight = 55;

  Future<void> getlocaleApp() async {
    String? locatName = await Token.getlocaleApp();
    if (locatName == 'en') {
      localeChangeNotifier.value = Locale("en", "US");
    } else if (locatName == 'ar') {
      localeChangeNotifier.value = Locale("ar", "AR");
    } else if (locatName == 'fa') {
      localeChangeNotifier.value = Locale("fa", "IR");
    } else {
      localeChangeNotifier.value = Locale("fa", "IR");
    }
  }

  Future<void> getTheme() async {
    themeChangeNotifier.value = await Token.getTheme();
  }

  static void showSnackBar(
      {required BuildContext context,
      required String msg,
      Color textColor = Colors.white,
      Color? backColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                msg,
                textDirection: TextDirection.rtl,
                maxLines: 5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'iranSans',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backColor ?? Theme.of(context).colorScheme.primary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(
          bottom: 30,
          right: 20,
          left: 20,
        ),
      ),
    );
  }

  static void showToast(
      {required String msg,
      Color textColor = Colors.white,
      Color? backColor = Colors.black,
      double fontSize = 13,
      String pos = 'bottom'}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backColor,
      textColor: textColor,
      fontSize: fontSize,
      gravity: pos == 'top' ? ToastGravity.TOP : ToastGravity.BOTTOM,
    );
  }


  static String StrConvertNumE2P(String strInput) {
    //String[] str = {'٠','١','٢','٣','٤','٥','٦','٧','٨','٩'};
    //char[] strFa = new char[]{'٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'};
    List<int> asciInt = [
      1776,
      1777,
      1778,
      1779,
      1780,
      1781,
      1782,
      1783,
      1784,
      1785
    ];
    var t1 = '/'.codeUnits;
    var t2 = ','.codeUnits;
    var t3 = '.'.codeUnits;

    List<String> strEn = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String strFinal = "";
    bool temp = true;
    for (int i = 0; i < strInput.length; i++) {
      temp = true;
      for (int j = 0; j < asciInt.length; j++) {
        var c = strInput.codeUnits[i];
        var c1 = String.fromCharCode(asciInt[j]).codeUnits.first;
        if (c == c1) {
          strFinal += strEn[j];
          temp = false;
          break;
        } else if (c == String.fromCharCode(1643) ||
            c == String.fromCharCode(t1[0]) ||
            c == String.fromCharCode(t2[0]) ||
            c == String.fromCharCode(t3[0])) {
          strFinal += ".";
          temp = false;
          break;
        }
      }
      if (temp) {
        strFinal += strInput[i];
      }
    }
    return strFinal;
  }

  static String dateSeprator(String date, String seprator) {
    String datefinal = "";
    if (date.contains('/') || date.contains('-')) {
      return date;
    }
    if (date.length == 8) {
      datefinal = date.substring(0, 4) +
          seprator +
          date.substring(4, 6) +
          seprator +
          date.substring(6, 8);
    } else if (date.length == 6) {
      datefinal = date.substring(0, 2) +
          seprator +
          date.substring(2, 4) +
          seprator +
          date.substring(4, 6);
    } else {
      datefinal = date;
    }
    return datefinal;
  }

  static String formatDate({required String date}) {
    int selectYear = int.parse(date.split("/")[0]);
    int selectMonth = int.parse(date.split("/")[1]);
    int selectDay = int.parse(date.split("/")[2]);
    String month = selectMonth >= 10 ? selectMonth.toString() : '0$selectMonth';
    String monthe =
        selectMonth >= 10 ? selectMonth.toString() : '0$selectMonth';
    String day = selectDay >= 10 ? selectDay.toString() : '0$selectDay';
    return '$selectYear/$month/$day';
  }

  // static singInDilog() {
  //   var ctxHolder = navigatorKey.currentContext;
  //
  //   final TextEditingController controller = TextEditingController();
  //   showDialog(
  //     context: ctxHolder!,
  //     barrierDismissible: false,
  //     builder: (pop) {
  //       var tempContext = pop;
  //       return WillPopScope(
  //         onWillPop: () async {
  //           showToast(
  //             msg: 'پسورد را وارد کنید.',
  //           );
  //           return false;
  //         },
  //         child: AlertDialog(
  //           insetPadding:
  //               const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
  //           actionsPadding: EdgeInsets.zero,
  //           content: SizedBox(
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Text(
  //                         'کد پرسنلی : ',
  //                         style: Theme.of(ctxHolder).textTheme.caption,
  //                       ),
  //                       Text(
  //                         Token.resultToken!.username!,
  //                         style:
  //                             Theme.of(ctxHolder).textTheme.caption!.copyWith(
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 4,
  //                   ),
  //                   const Divider(
  //                     height: .01,
  //                   ),
  //                   const SizedBox(
  //                     height: 4,
  //                   ),
  //                   Text(
  //                     'دسترسی شما منقضی شده است.\nبرای استفاده مجدد لطفا پسورد خود را وارد کنید.',
  //                     style: Theme.of(ctxHolder).textTheme.caption!.copyWith(
  //                           color: LightThemeColors.primaryColor,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 10,
  //                         ),
  //                   ),
  //                   // Text(
  //                   //   'پسورد خود را وارد کنید.',
  //                   //   style: Theme.of(ctxHolder).textTheme.caption!.copyWith(
  //                   //         color: LightThemeColors.primaryColor,
  //                   //         fontWeight: FontWeight.bold,
  //                   //         fontSize: 12,
  //                   //       ),
  //                   // ),
  //                   CustomTextField(
  //                       hint: 'رمز عبور را وارد کنید...',
  //                       obscureText: true,
  //                       padding: const EdgeInsets.symmetric(horizontal: 16),
  //                       controller: controller),
  //                   const SizedBox(
  //                     height: 16,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       OutlinedButton(
  //                         onPressed: () {
  //                           //exit(0);
  //                           Navigator.of(ctxHolder).pop();
  //                         },
  //                         child: Text(
  //                           'خروج',
  //                           style: Theme.of(ctxHolder!).textTheme.bodyText1,
  //                         ),
  //                       ),
  //                       const SizedBox(width: 20,),
  //                       Expanded(
  //                         child: BlocListener<AuthBloc, AuthState>(
  //                           listener: (context, state) {
  //                             if (state is AuthLoaded) {
  //                               Navigator.of(tempContext).pop();
  //                               showToast(
  //                                 msg: 'توکن جدید دریافت شد.',
  //                                 backColor: LightThemeColors.colorTitle,
  //                               );
  //                             } else if (state is AuthError) {
  //                               showToast(
  //                                 msg: 'پسورد اشتباه است.',
  //                                 backColor: LightThemeColors.primaryColorError,
  //                               );
  //                             }
  //                           },
  //                           child: BlocBuilder<AuthBloc, AuthState>(
  //                             builder: (context, state) {
  //                               return ElevatedButton(
  //                                 onPressed: () {
  //                                   if (controller.text.trim().isEmpty) {
  //                                     showToast(
  //                                       msg: 'پسورد نمیتواند خالی باشد.',
  //                                       backColor: LightThemeColors.primaryColorError,
  //                                     );
  //                                     return;
  //                                   }
  //                                   ctxHolder.read<AuthBloc>().add(
  //                                         AuthButtonIsClicked(
  //                                           username:
  //                                               Token.resultToken!.username!,
  //                                           password: controller.text.trim(),
  //                                         ),
  //                                       );
  //                                 },
  //                                 child: state is AuthLoading
  //                                     ? SizedBox(
  //                                         width: 80,
  //                                         child: LoadingScreenWave(
  //                                           size: 15,
  //                                           color: LightThemeColors.surface,
  //                                         ),
  //                                       )
  //                                     : SizedBox(
  //                                         width: 80,
  //                                         child: Text(
  //                                           'دریافت توکن جدید',
  //                                           style: Theme.of(ctxHolder)
  //                                               .textTheme
  //                                               .bodyText1!
  //                                               .copyWith(
  //                                                 color: LightThemeColors.surface,
  //                                               ),
  //                                         ),
  //                                       ),
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

}
