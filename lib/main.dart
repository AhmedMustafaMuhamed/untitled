import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Cubit.dart';
import 'package:untitled/states.dart';
import 'archived.dart';
import 'done.dart';
import 'drawer.dart';
import 'newTask.dart';
void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => MyCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: DrawerMenu()
      // MyHomePage(),
    );
  }
}




// class _MyHomePageState extends State<MyHomePage> {
//
// }
