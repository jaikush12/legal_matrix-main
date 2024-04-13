import 'dart:async';
import 'package:flutter/material.dart';
import 'package:legal_matrix/lawyer/lawyer.dart';
import 'package:legal_matrix/login/signup%20page.dart';
import 'package:legal_matrix/pref_util.dart';
import 'package:legal_matrix/prisoner/prisoner.dart';
import 'package:legal_matrix/role.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
              if (PrefUtil.getValue("role", "") == "lawyer") {
                return Lawyer();
              } else if (PrefUtil.getValue("role", "") == "prisoner") {
                return Prisoner();
              } else {
                return MyRole();
              }

              })));
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.075;
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 70,),
            Image.asset("assets/images/logo.png", height: 200,),
            Text(
              "Legal Matrix",
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontFamily: 'Roboto',
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
