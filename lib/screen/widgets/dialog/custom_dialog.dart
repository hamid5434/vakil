import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';

import 'i_custom_dialog.dart';

class CustomDialog implements ICustomDialog {
  @override
  Future? dialogFalid(
      {String title = 'افق کوروش',
      required String desc,
      required BuildContext context,
      GestureTapCallback? btnOkOnPress,
      GestureTapCallback? btnCancelOnPress,
      Function(DismissType p1)? onDismissCallback,
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
      Function(DismissType p1)? onDismissCallback,
      String btnOkText = 'تایید',
      String btnCancelText = 'برگشت',
      IconData btnCancelIcon = Icons.close,
      IconData btnOkIcon = Icons.check_circle}) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      btnOkColor: Theme.of(context).colorScheme.primary,
      btnCancelColor: Theme.of(context).colorScheme.secondary,
      btnCancelText: btnCancelText,
      btnCancelIcon: Icons.close,
      btnOkText: btnOkText,
      bodyHeaderDistance: 5,
      headerAnimationLoop: false,
      dialogType: DialogType.question,
      dialogBackgroundColor: Theme.of(context).colorScheme.surface,
      showCloseIcon: true,
      title: title,
      descTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      desc: desc,
      // customHeader: Image.asset('assets/images/ic_launcher.png',width: 50,height: 50,),
      btnOkOnPress: btnOkOnPress ??
          () {
            //  Navigator.of(context).pop();
          },
      btnOkIcon: Icons.check_circle,
      btnCancelOnPress: btnCancelOnPress ??
          () {
            //Navigator.of(context).pop();
          },
      onDismissCallback: onDismissCallback ??
          (type) {
            debugPrint('Dialog Dissmiss from callback $type');
          },
    ).show();
  }

  @override
  Future? dialogSuccess(
      {String title = 'افق کوروش',
      required String desc,
      required BuildContext context,
      GestureTapCallback? btnOkOnPress,
      GestureTapCallback? btnCancelOnPress,
      Function(DismissType p1)? onDismissCallback,
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
      Function(DismissType p1)? onDismissCallback,
      String btnOkText = 'تایید',
      String btnCancelText = 'برگشت',
      IconData btnCancelIcon = Icons.close,
      IconData btnOkIcon = Icons.check_circle}) {
    // TODO: implement dialogWarrning
    throw UnimplementedError();
  }
  

}
