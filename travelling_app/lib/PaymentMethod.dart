import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/ProfilePage.dart';
import 'LoginPage.dart';
import 'Setting.dart';
import 'HomePage.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}
class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:2,
    child:Scaffold(
        appBar: AppBar(
          title: Text("Payment Methods",style: TextStyle(fontSize: 30,color: Colors.white),),
          centerTitle: true,
          //backgroundColor: Colors.blueGrey,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
                begin: Alignment.bottomCenter,
              ),
            ),
          ), bottom: TabBar(
          indicatorColor: Colors.white ,
          tabs:[
            Tab(icon: Icon(Icons.arrow_right_alt_rounded),text: "Credit Card" ),
            Tab(icon: Icon(Icons.compare_arrows_sharp),text: "Fawry",),
          ],
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
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));}
              ),
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
                  onTap:(){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));}),
            ],
          ),
        ),
      body: TabBarView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Image.network("https://cdn-icons-png.flaticon.com/512/3154/3154412.png",width: 180,
                  //fit: BoxFit.fitWidth,
                  //image: AssetImage("assets/images/pngtree-vector-credit-card-icon-png-image_541801.png"),
                  //alignment: Alignment.center,
                ),
              //Text("Credit Card",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,color: Colors.blueGrey)),
              TextField(decoration: InputDecoration(labelText: "Your ID",border: OutlineInputBorder())),
                SizedBox(height: 20,),
              Align(
                  child: RaisedButton(
                      color: Color(0xFF254390),
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentMethod()));
                        // Navigator.of(context).pushNamed('');
                      }),
              )
            ],
            ),
            
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfR6zbmQBRkGPqOf9UvazX2DMO1RAzUwlU8w&usqp=CAU",height: 180,),
                Text("Fawry Code",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,color: Colors.blueGrey)),
              SizedBox(height: 20),
               Text("972619835",style: TextStyle(fontSize: 30),),
                SizedBox(height: 60,),
                RaisedButton(
                    color: Color(0xFF254390),
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentMethod()));
                      // Navigator.of(context).pushNamed('');
                    }),
               // TextField(decoration: InputDecoration(hintText: "your id")),

              ],
            ),

          ),

        ],
          //),
        /*Row(
            children: [
              Text("Fawry Code:"),
              TextField(decoration: InputDecoration(hintText: "your id"),),
            ],
          ),
        ],*/
    )
    ),
    );
  }
}
