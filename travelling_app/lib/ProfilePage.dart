import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'Setting.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              leading: Icon(Icons.person,color: Colors.deepPurple,size: 30,),
              title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
          onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));}),

            ListTile(
                leading: Icon(Icons.home,color: Colors.deepPurple,size: 30,),
                title: Text ('Home',style: TextStyle(fontSize: 20),),
                onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}),

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
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child:Row(
              children: [
                Icon(Icons.person_outline,size: 40,),
                SizedBox(width: 20,),
                Expanded(child: Text("My Email",style: TextStyle(fontSize: 20),)),
                //Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.vpn_key_outlined,size: 35,),
              SizedBox(width: 20,),
              Expanded(child: Text("My Password",style: TextStyle(fontSize: 20),)),
              //Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.bookmark_border,size: 40,),
              SizedBox(width: 20,),
              Expanded(child: Text("My Booking",style: TextStyle(fontSize: 20),)),
             // Icon(Icons.arrow_forward_ios),
            ],
          ),SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.star_border,size: 40,),
              SizedBox(width: 20,),
              Expanded(child: Text("Rate",style: TextStyle(fontSize: 20),)),
              //Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.logout,size: 40,),
              SizedBox(width: 20,),
              Expanded(child: Text("Log Out",style: TextStyle(fontSize: 20),)),
              //Icon(Icons.arrow_forward_ios),
            ],
          ),
        ],

      ),
    );
  }
}
