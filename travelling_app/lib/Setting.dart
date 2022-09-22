import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'FirstPage.dart';
import 'ChoicePage.dart';
//import 'package:flutter_settings_screens/flutter_settings_screens.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB1A6B3),Color(0xFFA176A7),Color(0xFF8C4895),Color(0xFF800F8F)],
              begin: Alignment.centerLeft,

            ),
          ),
        ),
        toolbarHeight: 80.0,),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration( gradient: LinearGradient(
                colors: [Color(0xFFB1A6B3),Color(0xFFA176A7),Color(0xFF8C4895),Color(0xFF800F8F)],
                begin: Alignment.centerLeft,

              ),),
              //padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                  SizedBox(height: 10,),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.deepPurple,size: 30,),
              title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),

            ListTile(
              leading: Icon(Icons.home,color: Colors.deepPurple,size: 30,),
              title: Text ('Home',style: TextStyle(fontSize: 20),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChoicePage()));}),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.deepPurple,size: 30,),
              title: Text ('Setting',style: TextStyle(fontSize: 20),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Setting()));}),
            ListTile(
              leading: Icon(Icons.vpn_key_outlined,color: Colors.deepPurple,size: 30,),
              title: Text ('LogOut',style: TextStyle(fontSize: 20,),),
    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),

          ],
        ),
      ),
     // body: ,
    );

  }

}
