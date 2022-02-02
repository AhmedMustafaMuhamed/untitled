

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'states.dart';

class MyCubit extends Cubit<MyStates> {

  MyCubit() : super(MyIntStates());

  static MyCubit get(context)=> BlocProvider.of(context);
  int index = 0;
  Database? database ;
  void changeIndex(int indx) {
    index = indx;
    emit(ChangeIndexState());
    emit(ChangeIndexState());
    print(index);
  }

  Future<void> creatDataBase() async {
    database = await openDatabase(
      'myCubit.db',
      version: 1,
      onCreate: ( database, int ver) async {
        await database.execute(
            'CREATE TABLE Task (id INTEGER PRIMARY KEY, name TEXT, date TEXT, time TEXT)');
        await database.transaction((txn) async {
          int id1 = await txn.rawInsert(
              'INSERT INTO Task(name, date, time) VALUES("some name", 1234, 456.789)');
          emit(CreateDatabaseState());
          print('inserted1: $id1');
        });
      },
    );
  }

}
