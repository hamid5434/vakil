import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vakil_0098/common/token.dart';
import 'package:vakil_0098/screen/widgets/dialog/custom_dialog.dart';
import 'package:vakil_0098/screen/widgets/dialog/i_custom_dialog.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.username,
    required this.personlid,
  }) : super(key: key);
  final String username;
  final String personlid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 40,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      'کد پرسنلی :',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      personlid,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              ICustomDialog dialog = CustomDialog();
              dialog.dialogQuestion(
                  desc: 'آیا از خروج اطمینان دارید؟',
                  context: context,
                  btnOkOnPress: () async {
                    await Token.reomveUserSaved();
                    //Restart.restartApp(webOrigin: AppName.SPLASH_SCREEN);

                  });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.power_settings_new,
                  color: Theme.of(context).colorScheme.error,
                  size: 19,
                ),
                Text(
                  'خروج کاربر',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                ),
              ],
            ),
          ),

          // ValueListenableBuilder(
          //     builder: (context, value, child) => SizedBox(
          //           width: 40,
          //           child: TextButton(
          //             onPressed: () {
          //               if (Common.themeChangeNotifier.value == 'light') {
          //                 Common.themeChangeNotifier.value = 'dark';
          //               } else {
          //                 Common.themeChangeNotifier.value = 'light';
          //               }
          //             },
          //             child: Text(
          //               Common.themeChangeNotifier.value == 'light'
          //                   ? 'شب'
          //                   : 'روز',
          //               style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //             ),
          //           ),
          //         ),
          //     valueListenable: Common.themeChangeNotifier),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              //'نسخه\n${GetVersion.appVersion!.version}-${GetVersion.appVersion!.buildNumber}',
              'نسخه',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: .9,
                    fontSize: 11,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

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
