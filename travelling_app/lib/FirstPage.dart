import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/ChoicePage.dart';
import 'package:travelling_app/HomePage.dart';
import 'package:travelling_app/LoginPage.dart';
import 'package:travelling_app/Setting.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        /*appBar: AppBar(
          title: Text("",style: TextStyle(fontSize: 30,color: Colors.white),),
          centerTitle: true,
          //backgroundColor: Colors.blueGrey,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
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
                colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
               //colors: [Color(0xFFB1A6B3),Color(0xFFA176A7),Color(0xFF8C4895),Color(0xFF800F8F)],
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

            ),
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
      ),*/
      body:Center(
          child: Container(//alignment: Alignment(250,350),
            margin: EdgeInsets.all(0),
            color: Color(0xFF9CB2EA),
            child: Center(
              //
              child:Container(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /* InkWell(
              child:Image(
              //Image.network("https://i.pinimg.com/originals/43/3b/6c/433b6c5336c72a21bcfd9db8d831562a.gif"
              //fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/Untitled.png"),
              alignment: Alignment.center,
            ),
            onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),*/
                  Container(
                    margin: EdgeInsets.fromLTRB( 30,280,30,50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Travelito",style: TextStyle(fontSize: 60,color: Colors.white,),),
                        Icon(Icons.airplanemode_active,color: Colors.white,size: 40,),
                      ],
                    ),

                  ),

                  IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}, icon: Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,))
                ],),
                  )
            )
          ),
        ),
    );
  }
}
