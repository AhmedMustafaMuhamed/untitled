// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/states.dart';
import 'done.dart';
import 'newTask.dart';
import 'archived.dart';
import 'Cubit.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);

  var _ScafoldKey = GlobalKey<ScaffoldState>();
  var titleControler = TextEditingController();
  var DateControler = TextEditingController();
  var TimeControler = TextEditingController();
  var name = 'Mohamed Hassan';

  var email = 'mohamed_hassan@gmail.com';

  List<Widget> screens = [NewTask(), Done(), Archived()];

  var lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyCubit()..creatDataBase(),
      child: BlocConsumer<MyCubit, MyStates>(
        listener: (BuildContext context, MyStates state) {},
        builder: (BuildContext, MyStates state) => Scaffold(
          key: _ScafoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  /* setState(() {
                        // Navigator.pop(context);
                      });*/
                },
              )
            ],
            title: Text('ToDo'),
            leading: IconButton(
                onPressed: () {
                  // setState(() {
                  //   _ScafoldKey.currentState?.openDrawer();
                  // });
                },
                icon: Icon(Icons.menu)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _ScafoldKey.currentState?.showBottomSheet(
                (context) => Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: titleControler,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'enter Titlel',
                            icon: Icon(Icons.title_rounded),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: titleControler,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'enter Titlel',
                            icon: Icon(Icons.title_rounded),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: titleControler,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'enter Titlel',
                            icon: Icon(Icons.title_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
//wait untill insert in database
              Navigator.pop(context);
            },
            child: Icon(Icons.add),
          ),
          body: lastIndex != MyCubit.get(context).index
              ? screens[MyCubit.get(context).index]
              : screens[0],
          // body: Stack(
          //   children: Screens,
          // ),
          drawer: Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: Image.network(
                          'https://th.bing.com/th/id/OIP.bzEmvp7jSfekbiqCu-wg3gHaHa?pid=ImgDet&rs=1'),
                    ),
                  ),
                  Text('Name : $name'),
                  Text('E-mail : $email'),
                  Divider(
                    height: 15,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   MyCubit.get(context).index ;
                      //   Navigator.pop(context);
                      // });
                    },
                    child: Text('NewTask'),
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   MyCubit.get(context).index;
                      //   Navigator.pop(context);
                      // });
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   MyCubit.get(context).index ;
                      //   Navigator.pop(context);
                      // });
                    },
                    child: Text('Archived'),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: MyCubit.get(context).changeIndex,

            currentIndex: MyCubit.get(context).index,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.task), label: 'NewTask'),
              BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: 'Archived'),
            ],
          ),
        ),
      ),
    );
  }
}
