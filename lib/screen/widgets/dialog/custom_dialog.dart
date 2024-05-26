import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vakil_0098/common/theme.dart';


import '../../../common/context_utility.dart';
import '../button/custom_elevated_button.dart';
import 'i_custom_dialog.dart';

class CustomDialog implements ICustomDialog {
  @override
  Future? dialogFalid(
      {String title = 'افق کوروش',
        required String desc,
        required BuildContext context,
        GestureTapCallback? btnOkOnPress,
        GestureTapCallback? btnCancelOnPress,
        Function(String p1)? onDismissCallback,
        String btnOkText = 'تایید',
        String btnCancelText = 'برگشت',
        IconData btnCancelIcon = Icons.close,
        IconData btnOkIcon = Icons.check_circle}) {
    // TODO: implement dialogFalid
    throw UnimplementedError();
  }

  @override
  Future? dialogQuestion(
      {String title = 'افق کوروش',
        required String desc,
        required BuildContext context,
        GestureTapCallback? btnOkOnPress,
        GestureTapCallback? btnCancelOnPress,
        Function(String p1)? onDismissCallback,
        String btnOkText = 'تایید',
        String btnCancelText = 'برگشت',
        IconData btnCancelIcon = Icons.close,
        IconData btnOkIcon = Icons.check_circle}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        actionsPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: SizedBox(
          // height: MediaQuery.of(context).size.width * .85,
          // width: MediaQuery.of(context).size.width * .8,
          //color: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          btnOkOnPress!();
                          Navigator.of(context).pop();
                        } ,
                        child: Text(
                          btnOkText,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    OutlinedButton(
                      onPressed: btnCancelOnPress ??
                              () {
                            Navigator.of(context).pop();
                          },
                      child: Text(
                        btnCancelText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return AwesomeDialog(
    //   context: context,
    //   animType: AnimType.bottomSlide,
    //   btnOkColor: Theme.of(context).colorScheme.primary,
    //   btnCancelColor: Theme.of(context).colorScheme.secondary,
    //   btnCancelText: btnCancelText,
    //   btnCancelIcon: Icons.close,
    //   btnOkText: btnOkText,
    //   bodyHeaderDistance: 5,
    //   headerAnimationLoop: false,
    //   dialogType: DialogType.question,
    //   dialogBackgroundColor: Theme.of(context).colorScheme.surface,
    //   showCloseIcon: true,
    //   title: title,
    //   descTextStyle: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //   ),
    //   desc: desc,
    //   // customHeader: Image.asset('assets/images/ic_launcher.png',width: 50,height: 50,),
    //   btnOkOnPress: btnOkOnPress ??
    //       () {
    //         //  Navigator.of(context).pop();
    //       },
    //   btnOkIcon: Icons.check_circle,
    //   btnCancelOnPress: btnCancelOnPress ??
    //       () {
    //         //Navigator.of(context).pop();
    //       },
    //   onDismissCallback: onDismissCallback ??
    //       (type) {
    //         debugPrint('Dialog Dissmiss from callback $type');
    //       },
    // ).show();
  }

  @override
  Future? dialogSuccess(
      {String title = 'افق کوروش',
        required String desc,
        required BuildContext context,
        GestureTapCallback? btnOkOnPress,
        GestureTapCallback? btnCancelOnPress,
        Function(String p1)? onDismissCallback,
        String btnOkText = 'تایید',
        String btnCancelText = 'برگشت',
        IconData btnCancelIcon = Icons.close,
        IconData btnOkIcon = Icons.check_circle}) {
    // TODO: implement dialogSuccess
    throw UnimplementedError();
  }

  @override
  Future? dialogWarrning(
      {String title = 'افق کوروش',
        required String desc,
        required BuildContext context,
        GestureTapCallback? btnOkOnPress,
        GestureTapCallback? btnCancelOnPress,
        Function(String p1)? onDismissCallback,
        String btnOkText = 'تایید',
        String btnCancelText = 'برگشت',
        IconData btnCancelIcon = Icons.close,
        IconData btnOkIcon = Icons.check_circle}) {
    // TODO: implement dialogWarrning
    throw UnimplementedError();
  }

  @override
  Future? dialogInfo(
      {String title = 'افق کوروش',
        required String desc,
        required BuildContext context,
        GestureTapCallback? btnOkOnPress,
        GestureTapCallback? btnCancelOnPress,
        Function(String p1)? onDismissCallback,
        String btnOkText = 'تایید',
        String btnCancelText = 'برگشت',
        IconData btnCancelIcon = Icons.close,
        IconData btnOkIcon = Icons.check_circle}) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        actionsPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: SizedBox(
          // height: MediaQuery.of(context).size.width * .85,
          // width: MediaQuery.of(context).size.width * .8,
          //color: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        btnOkOnPress!();
                        Navigator.of(context).pop();
                      } ,
                      child: Text(
                        btnOkText,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: btnCancelOnPress ??
                              () {
                            Navigator.of(context).pop();
                          },
                      child: Text(
                        btnCancelText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return AwesomeDialog(
    //   context: context,
    //   animType: AnimType.bottomSlide,
    //   btnOkColor: Theme.of(context).colorScheme.primary,
    //   btnCancelColor: Theme.of(context).colorScheme.secondary,
    //   btnCancelText: btnCancelText,
    //   btnCancelIcon: Icons.close,
    //   btnOkText: btnOkText,
    //   bodyHeaderDistance: 5,
    //   headerAnimationLoop: false,
    //   dialogType: DialogType.info,
    //   dialogBackgroundColor: Theme.of(context).colorScheme.surface,
    //   showCloseIcon: true,
    //   title: title,
    //   descTextStyle: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //   ),
    //   desc: desc,
    //   // customHeader: Image.asset('assets/images/ic_launcher.png',width: 50,height: 50,),
    //   btnOkOnPress: btnOkOnPress ??
    //       () {
    //         //  Navigator.of(context).pop();
    //       },
    //   btnOkIcon: Icons.check_circle,
    //   btnCancelOnPress: btnCancelOnPress ??
    //       () {
    //         //Navigator.of(context).pop();
    //       },
    //   onDismissCallback: onDismissCallback ??
    //       (type) {
    //         debugPrint('Dialog Dissmiss from callback $type');
    //       },
    // ).show();
  }

  @override
  Future<dynamic>? appDialog({
    Widget? title,
    double? height,
    Widget? content,
    String? contentLabel,
    List<Widget>? actions,
    String? actionLabelLeft,
    String? actionLabelRight,
    GestureTapCallback? onTapLeft,
    GestureTapCallback? onTapRight,
    GestureTapCallback? onTapClose,
    MainAxisAlignment? actionsAlignment,
  }) async {
    ThemeData themeData = Theme.of(ContextUtility.navigatorKey.currentContext!);

    return await showDialog(
      context: ContextUtility.navigatorKey.currentContext!,
      barrierColor: Colors.black.withOpacity(0.50),
      barrierDismissible: true,
      barrierLabel: '',
      builder: (context) => SizedBox(
        height: height ?? 180.0,
        width: double.maxFinite,
        child: AlertDialog(
          titlePadding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 22.0),
          contentPadding: const EdgeInsets.only(bottom: 0.0),
          backgroundColor:  Colors.white.withOpacity(0.10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),side: BorderSide(width: 2,color: Colors.white.withOpacity(0.20))),
          content: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: height ?? 180.0,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.transparent.withOpacity(0.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                          child: title ?? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(12.0),
                                onTap: onTapClose ?? () => Navigator.of(ContextUtility.navigatorKey.currentContext!).pop(),
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset('assets/img/close.svg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                contentLabel ?? "آیا تسک مورد نظر انجام شد ؟",
                                style: themeData.textTheme.titleLarge!.copyWith(color: themeData.colorScheme.surface),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 25.0),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: actions ?? [
                            CustomElevatedButton(
                              onPressed: onTapRight ?? () => Navigator.of(ContextUtility.navigatorKey.currentContext!).pop(),
                              backgroundColor: kPrimaryColor.withOpacity(0.5),
                              foregroundColor: themeData.colorScheme.surface,
                              borderRadius: BorderRadius.circular(20.0),
                              padding: const EdgeInsets.symmetric(),
                              color: kPrimaryColor,
                              borderWith: 1.2,
                              child: Text(
                                actionLabelRight ?? 'بله',
                                style: themeData.textTheme.titleMedium!.copyWith(color: themeData.colorScheme.surface),
                              ),
                            ),
                            CustomElevatedButton(
                              onPressed: onTapLeft ?? () => Navigator.of(ContextUtility.navigatorKey.currentContext!).pop(),
                              backgroundColor: kPrimaryColor.withOpacity(0.2),
                              foregroundColor: themeData.colorScheme.surface,
                              borderRadius: BorderRadius.circular(20.0),
                              padding: const EdgeInsets.symmetric(),
                              color: kPrimaryColor,
                              borderWith: 1.2,
                              child: Text(
                                actionLabelLeft ?? 'خیر',
                                style: themeData.textTheme.titleMedium!.copyWith(color: themeData.colorScheme.surface),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
