import 'package:sqflite/sqflite.dart';

class Localdatabase {

  static late Database database;
  static Future<void> createDatabase() async {
    database = await openDatabase(
      'travelito',
      version: 1,
      onCreate: (Database, version) {
        print('database is created!!');
        Database.execute(
          ' CREATE TABLE Test (Email TEXT PRIMARY KEY ,PASSWORD TEXT  )',
        ).then((value) {
          print('Table is created ');
        }).catchError((Error) {
          print(Error.toString());
        });
      },
      onOpen: (db) {
        print('database is open ');
      },
    );
    void insertDatabase(String Email, String Password) {
      database.rawInsert('Insert Into test (Email,PASSWORD)  valuse (?,?)',
          [Email, Password]).then((value) {
        print(value);

      }).catchError((error){
        print(error.toString());

      });
    }
  }
}