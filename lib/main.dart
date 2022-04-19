import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson2/cubit/app_cubit_logics.dart';
import 'package:flutter_lesson2/cubit/app_cubits.dart';
import 'package:flutter_lesson2/misc/colors.dart';
import 'package:flutter_lesson2/nav_pages/main_page.dart';
import 'package:flutter_lesson2/pages/detail_page.dart';
import 'package:flutter_lesson2/pages/home_page.dart';
import 'package:flutter_lesson2/services/data_services.dart';
import 'pages/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}
