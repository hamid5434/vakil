import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakil_0098/common/common.dart';
import 'package:vakil_0098/common/theme.dart';
import 'package:vakil_0098/data/repository/auth/auth_repository.dart';
import 'package:vakil_0098/data/service/service.dart';
import 'package:vakil_0098/data/source/auth/auth_data_source.dart';
import 'package:vakil_0098/screen/home/root_screen.dart';
import 'package:vakil_0098/screen/widgets/text_field/custom_text_field.dart';
import 'package:vakil_0098/screen/widgets/text_field/password_textfield.dart';
import '../home/home_screen.dart';
import 'bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShow = false;
  TextEditingController usernameController = TextEditingController(text: 'h_khobani@yahoo.com');
  TextEditingController passwordController = TextEditingController(text: '111');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
        dataSource: AuthDataSource(
          service: Service(),
        ),
      ),
      child: BlocProvider(
        create: (contextP) {
          var bloc = AuthBloc(repository: contextP.read<AuthRepository>());
          return bloc;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoaded) {
                    //Navigator.pushReplacementNamed(context, AppName.HOME);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RootScreen(),
                      ),
                    );
                  }
                  if (state is AuthError) {
                    String msg = state.exception.message.toString();
                    if (state.exception.statusCode == 400) {
                      msg = 'نام کاربری یا رمز عبور اشتباه است';
                    }
                    Common.showToast(msg: msg, pos: 'top');
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) {
                    return current is AuthLoading ||
                        current is AuthInitial ||
                        current is AuthError;
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .75 - 25,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                top: -MediaQuery.of(context).size.width * .25,
                                right: -MediaQuery.of(context).size.width * .27,
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(top: 70, right: 20),
                                  height:
                                      MediaQuery.of(context).size.width * .9,
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: BoxDecoration(
                                    //color: Theme.of(context).colorScheme.background,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: LightThemeColors.primaryColor,
                                        width: 2),
                                  ),
                                  child: SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 200,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        // Center(
                                        //   child: Image.asset(
                                        //     'assets/images/logo1.png',
                                        //     color:
                                        //         LightThemeColors.primaryColor,
                                        //     width: 160,
                                        //     height: 160,
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          width: 1,
                                          height: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: Text(
                            'نام کاربری',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: CustomTextField(
                            hint: 'نام کاربری',
                            prefixIcon: Icons.person_outline,
                            suffixIcon: Icons.remove_red_eye_sharp,
                            prefixIconSize: 24,
                            controller: usernameController,
                            callbackPrefixIcon: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: Text(
                            'رمز عبور',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: PasswordTextField(
                            controller: passwordController,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    const AuthIsSave(),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      state.isSave
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: state.isSave
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'بخاطر سپردن',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'فراموشی رمز عبور',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 25, bottom: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthButtonIsClicked(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40),
                              primary: LightThemeColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: state is AuthLoading
                                ? SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'ورود',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: LightThemeColors.surface,
                                        ),
                                  ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '****',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'نسخه  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      '1.0.1-1',
                                      textDirection: TextDirection.ltr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    // Path path = Path();
    // path.lineTo(size.width , size.height);
    //
    // path.lineTo(size.width , 0.0);
    // return path;

    double radius = 50;
    double pi = 3.14;

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(
              Offset(size.width - radius, 0), Offset(size.width, radius)),
          // Rect
          1.5 * pi, // Start engle
          0.5 * pi, // Sweep engle
          true) // direction clockwise
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height),
          0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
