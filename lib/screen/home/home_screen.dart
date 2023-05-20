import 'package:flutter/material.dart';
import 'package:vakil_0098/common/token.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(
              // personlid: "Token.resultToken!.firstName!",
              // username:'Token.resultToken!.fullName!',
              personlid: "hamid",
              username:'111',
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
