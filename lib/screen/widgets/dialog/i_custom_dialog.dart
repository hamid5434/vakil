import 'package:flutter/material.dart';

abstract class ICustomDialog {
  Future<dynamic>? dialogSuccess({
    String title = 'افق کوروش',
    required String desc,
    required BuildContext context,
    GestureTapCallback? btnOkOnPress,
    GestureTapCallback? btnCancelOnPress,
    //Function(DismissType)? onDismissCallback,
    Function(String)? onDismissCallback,
    String btnOkText = 'تایید',
    String btnCancelText= 'برگشت',
    IconData btnCancelIcon = Icons.close,
    IconData btnOkIcon = Icons.check_circle,
  });
  Future<dynamic>? dialogQuestion({
    String title = 'افق کوروش',
    required String desc,
    required BuildContext context,
    GestureTapCallback? btnOkOnPress,
    GestureTapCallback? btnCancelOnPress,
    Function(String)? onDismissCallback,
    String btnOkText = 'تایید',
    String btnCancelText= 'برگشت',
    IconData btnCancelIcon = Icons.close,
    IconData btnOkIcon = Icons.check_circle,
  });
  Future<dynamic>? dialogFalid({
    String title = 'افق کوروش',
    required String desc,
    required BuildContext context,
    GestureTapCallback? btnOkOnPress,
    GestureTapCallback? btnCancelOnPress,
    Function(String)? onDismissCallback,
    String btnOkText = 'تایید',
    String btnCancelText= 'برگشت',
    IconData btnCancelIcon = Icons.close,
    IconData btnOkIcon = Icons.check_circle,
  });
  Future<dynamic>? dialogWarrning({
    String title = 'افق کوروش',
    required String desc,
    required BuildContext context,
    GestureTapCallback? btnOkOnPress,
    GestureTapCallback? btnCancelOnPress,
    Function(String)? onDismissCallback,
    String btnOkText = 'تایید',
    String btnCancelText= 'برگشت',
    IconData btnCancelIcon = Icons.close,
    IconData btnOkIcon = Icons.check_circle,
  });
  Future<dynamic>? dialogInfo({
    String title = 'افق کوروش',
    required String desc,
    required BuildContext context,
    GestureTapCallback? btnOkOnPress,
    GestureTapCallback? btnCancelOnPress,
    Function(String)? onDismissCallback,
    String btnOkText = 'تایید',
    String btnCancelText= 'برگشت',
    IconData btnCancelIcon = Icons.close,
    IconData btnOkIcon = Icons.check_circle,
  });

  Future<dynamic>? appDialog({
    Widget? title,
    Widget? content,
    String? contentLabel,
    List<Widget>? actions,
    String? actionLabelLeft,
    String? actionLabelRight,
    GestureTapCallback? onTapLeft,
    GestureTapCallback? onTapRight,
    GestureTapCallback? onTapClose,
    MainAxisAlignment? actionsAlignment,
  });

}

// // This is a block of Model Dialog
// showDialogFunc(context) {
//   AwesomeDialog(
//     context: context,
//     animType: AnimType.bottomSlide,
//     btnOkColor: Theme.of(context).colorScheme.primary,
//     btnCancelColor: Theme.of(context).colorScheme.secondary,
//     btnCancelText: 'برگشت',
//     btnCancelIcon: Icons.close,
//     btnOkText: 'خروج',
//     bodyHeaderDistance: 5,
//     headerAnimationLoop: false,
//     dialogType: DialogType.error,
//     dialogBackgroundColor: Theme.of(context).colorScheme.surface,
//     showCloseIcon: true,
//     title: 'خروج کاربر',
//     descTextStyle: const TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     ),
//     desc: 'آیا از خروج کاربر اطمینان دارید؟',
//     // customHeader: Image.asset('assets/images/ic_launcher.png',width: 50,height: 50,),
//     btnOkOnPress: () {
//       Token.reomveUserSaved();
//       Navigator.of(context).popUntil(ModalRoute.withName(AppName.LOGIN));
//     },
//     btnOkIcon: Icons.check_circle,
//     btnCancelOnPress: () {},
//     onDismissCallback: (type) {
//       debugPrint('Dialog Dissmiss from callback $type');
//     },
//   ).show();
//   // return showDialog(
//   //   context: context,
//   //   builder: (context) {
//   //     return Center(
//   //       child: Material(
//   //         type: MaterialType.transparency,
//   //         child: Container(
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.circular(10),
//   //             color: Colors.white,
//   //           ),
//   //           padding: EdgeInsets.all(15),
//   //           height: 320,
//   //           width: MediaQuery.of(context).size.width * 0.7,
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.center,
//   //             children: <Widget>[
//   //               ClipRRect(
//   //                 borderRadius: BorderRadius.circular(5),
//   //                 child: Image.asset(
//   //                   img,
//   //                   width: 200,
//   //                   height: 200,
//   //                 ),
//   //               ),
//   //               SizedBox(
//   //                 height: 10,
//   //               ),
//   //               Text(
//   //                 title,
//   //                 style: TextStyle(
//   //                   fontSize: 25,
//   //                   color: Colors.grey,
//   //                   fontWeight: FontWeight.bold,
//   //                 ),
//   //               ),
//   //               SizedBox(
//   //                 height: 10,
//   //               ),
//   //               Container(
//   //                 // width: 200,
//   //                 child: Align(
//   //                   alignment: Alignment.center,
//   //                   child: Text(
//   //                     desc,
//   //                     maxLines: 3,
//   //                     style: TextStyle(fontSize: 15, color: Colors.grey[500]),
//   //                     textAlign: TextAlign.center,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   },
//   // );
// }
