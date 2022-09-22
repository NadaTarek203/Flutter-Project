//import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/ChoicePage.dart';
import 'package:travelling_app/ProfilePage.dart';
import 'Setting.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
final List<String>myList=[
  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1257553494.jpg?crop=1.00xw:0.849xh;0,0.118xh&resize=1600:*",
  "https://www.isolatedtraveller.com/wp-content/uploads/2021/05/What-is-the-capital-city-of-France-1.png",
  "https://ychef.files.bbci.co.uk/976x549/p01lnkdy.jpg",
  "https://ychef.files.bbci.co.uk/1600x900/p07zy3y6.webp",
  "https://images.memphistours.com/large/a1941e50cb262271d6f737449e4d8233.jpg",
  "https://www.kt-travel.com/uploads/packageimage/KADMAR_2081126_2020-11-15-03-57-28.jpg",
  "https://www.kt-travel.com/uploads/packageimage/KADMAR_5262302_2020-11-15-03-57-28.jpg"
];
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travelito",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        actions:[ IconButton(icon:Icon (Icons.directions_bus,size: 30,),onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChoicePage()));}
        ),],
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
              leading: Icon(Icons.person,color:Color(0xFF5C74B3),size: 30,),
              title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
          onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));}
            ),
            ListTile(
                leading: Icon(Icons.home,color: Color(0xFF5C74B3),size: 30,),
                title: Text ('Home',style: TextStyle(fontSize: 20),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}),

            ListTile(
                leading: Icon(Icons.settings,color: Color(0xFF5C74B3),size: 30,),
                title: Text ('Setting',style: TextStyle(fontSize: 20),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Setting()));}),

            ListTile(
                leading: Icon(Icons.vpn_key_outlined,color: Color(0xFF5C74B3),size: 30,),
                title: Text ('LogOut',style: TextStyle(fontSize: 20,),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),
          ],
        ),
      ),
      body:Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            CarouselSlider(items: myList.map((item) => Container(
            child: Center(
              child: Image.network(item,fit: BoxFit.cover,width: 1000,height: 1000,),
            ),
            )
            ).toList()
                , options:CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,

                ),
            ),
            Image(image:AssetImage("assets/images/Screenshot_20220216-114220_Wego Flights & Hotels.jpg"),height: 500,)
          ],
        ),
      )
      /*Column(
        children: [
          Image.network("https://qph.fs.quoracdn.net/main-qimg-244ee01604af4cc98855b7ac82a36921"),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:Color(0xFF5C74B3) ,),

            child: Text("Tickets Reservation",style: TextStyle(fontSize: 40),),
          ),
          Container(
            color:Color(0xFF5C74B3) ,
            child: Text("Rate"),
          ),
          Container(
              color:Color(0xFF5C74B3) ,
              child:Text("About App")
          )
        ],
      )*/
    );
  }
}
