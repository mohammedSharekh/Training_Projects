import 'package:bmi_calculater/layout/home_layout.dart';
import 'package:bmi_calculater/models/users_models.dart';
import 'package:bmi_calculater/modules/bmi/bmi_screen.dart';
import 'package:bmi_calculater/modules/counter/counter_screen.dart';
import 'package:bmi_calculater/modules/home/home_screen.dart';
import 'package:bmi_calculater/modules/login/login_screen.dart';
import 'package:bmi_calculater/modules/messenger/messenger_screen.dart';
import 'package:bmi_calculater/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeLayout(),
    );
  }
}
