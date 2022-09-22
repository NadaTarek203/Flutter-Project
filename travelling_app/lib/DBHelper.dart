

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:travelling_app/RegisterationDatabase.dart';

class DBHelper{
static final DBHelper _instance=DBHelper.internal();
factory DBHelper()=>_instance;
DBHelper.internal();
 static late Database _db;
Future<Database> createDatabase() async
 {
  if (_db!=null)
    {
      return _db;
    }
  String path=join(await getDatabasesPath(),'Register.db');
 _db=await openDatabase(path,
      version: 1,
      onCreate:(Database db,int v){
//create tables
      db.execute('create table users(email varchar(50) primary key,pass varchar(50),conPass varchar(50)');
      });
 return _db;

 }
 Future<dynamic> createAccount(RegisterationDatabase Rdatabase) async{//??
  Database db= await createDatabase();
  return db.insert('users', Rdatabase.toMap());
 }
Future<List> allAccounts()async{
  Database db= await createDatabase();
  return db.query('users');
 }
 Future<dynamic>delete(String email) async
 {
   Database db= await createDatabase();
   return db.delete('users',where: 'email=?',whereArgs: [email]);

 }

}