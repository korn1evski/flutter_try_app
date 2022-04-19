
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson2/cubit/app_cubit_states.dart';
import 'package:flutter_lesson2/cubit/app_cubits.dart';
import 'package:flutter_lesson2/pages/welcome_page.dart';

import '../nav_pages/main_page.dart';
import '../pages/detail_page.dart';
import '../pages/home_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else if (state is LoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else if (state is LoadedState) {
            return MainPage();
          }
          else if (state is DetailState){
            return DetailPage();
          }
          else {
            return Container();
          }
        }
      )
    );
  }
}
