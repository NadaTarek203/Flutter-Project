import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/BusScreen.dart';
import 'package:travelling_app/LoginPage.dart';
import 'package:travelling_app/Plane.dart';
import 'package:travelling_app/Train.dart';
import 'HomePage.dart';
import 'Setting.dart';
class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Travelito",style: TextStyle(fontSize: 30,color: Colors.white),),
          centerTitle: true,
          //backgroundColor: Colors.blueGrey,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
                begin: Alignment.bottomCenter,

              ),
            ),
          ),
          toolbarHeight: 80.0,),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              /*DrawerHeader(
              decoration: BoxDecoration( gradient: LinearGradient(
                colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],

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
            ),*/
              ListTile(
                leading: Icon(Icons.person,color: Color(0xFF254390),size: 30,),
                title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}
              ),
              ListTile(
                  leading: Icon(Icons.home,color: Color(0xFF254390),size: 30,),
                  title: Text ('Home',style: TextStyle(fontSize: 20),),
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}),

              ListTile(
                  leading: Icon(Icons.settings,color: Color(0xFF254390),size: 30,),
                  title: Text ('Setting',style: TextStyle(fontSize: 20),),
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Setting()));}),

              ListTile(
                  leading: Icon(Icons.vpn_key_outlined,color:Color(0xFF254390),size: 30,),
                  title: Text ('LogOut',style: TextStyle(fontSize: 20,),),
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),
            ],
          ),
        ),
      body:
           Container(
             color: Color(0xFFC7CAE5),
             child:
           Column(children: [
             InkWell(
               child: Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color(0xFF254390),),

                   width: double.infinity,
                   height: 150.0,

                   margin: EdgeInsets.fromLTRB(10,30,10,20),
                   padding: EdgeInsets.fromLTRB(20,20,40,20),
                   child:Center(
                       child:Row(
                         children: [
                           Icon(Icons.airplanemode_active,size: 50,),
                           Text("    Plane       ",style: TextStyle(fontSize: 40,),),
                           Icon(Icons.arrow_forward_ios,size: 30,),
                         ],
                         //Icon(Icons.airplanemode_active).toString(),) ,
                       )
                   )

               ),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Plane()));
               },),
             InkWell(
               child: Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color(0xFF254390),),
                   //color:Color(0xFFB1A6B3),
                   width: double.infinity,
                   height: 150.0,

                   margin: EdgeInsets.fromLTRB(10,30,10,20),
                   padding: EdgeInsets.fromLTRB(20,20,40,20),
                   child:Center(
                       child:Row(
                         children: [
                           Icon(Icons.train,size: 50,),
                           Text("    Train        ",style: TextStyle(fontSize: 40),),
                           Icon(Icons.arrow_forward_ios,size: 30,),
                         ],
                         //Icon(Icons.airplanemode_active).toString(),) ,
                       )
                   )

               ),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Train()));
               },)
             ,InkWell(
               child: Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color(0xFF254390),),
                   width: double.infinity,
                   height: 150.0,
                   margin: EdgeInsets.fromLTRB(10,30,10,20),
                   padding: EdgeInsets.fromLTRB(20,20,40,20),
                   child:Center(
                       child:Row(
                         children: [
                           Icon(Icons.directions_bus,size: 50,),
                           Text("    Bus          ",style: TextStyle(fontSize: 40),),
                           Icon(Icons.arrow_forward_ios,size: 30,),
                         ],
                         //Icon(Icons.airplanemode_active).toString(),) ,
                       )
                   )

               ),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BusScreen()));
               },)

           ],)
             ,)



    );}
}
