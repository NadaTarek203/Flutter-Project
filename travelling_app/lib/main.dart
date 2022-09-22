import 'package:flutter/material.dart';
import 'package:travelling_app/ChoicePage.dart';
import 'package:travelling_app/Localdatabase.dart';
import 'package:travelling_app/MyThemes.dart';
import 'package:travelling_app/Setting.dart';
import 'FirstPage.dart';
import 'Localdatabase.dart';
import 'package:sqflite/sqlite_api.dart';
void main() async
{
  /*WidgetsFlutterBinding.ensureInitialized();
  await Localdatabase.createDatabase();*/
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
      home:FirstPage() ,
    );

  }
}

