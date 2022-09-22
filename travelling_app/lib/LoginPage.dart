// ignore: file_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/HomePage.dart';
import 'package:travelling_app/RegisterPage.dart';
import 'package:travelling_app/RegisterationDatabase.dart';
import 'ChoicePage.dart';
import 'DBHelper.dart';
import 'FirstPage.dart';
import 'ProfilePage.dart';
import 'HomePage.dart';
import 'Setting.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("",style: TextStyle(fontSize: 30,color: Colors.white),),
        //centerTitle: true,
        //backgroundColor: Colors.blueGrey,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
              begin: Alignment.bottomCenter,
            ),
          ),
        ),
        toolbarHeight: 80.0,
      ),
     /* drawer: Drawer(
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
      ),*/
   body: SingleChildScrollView(
     child: Column(
       children: [
         Stack(children: [
           Container(
             height: MediaQuery.of(context).size.height * 0.4,
             decoration: BoxDecoration(
                 //color: Colors.indigoAccent[50],
                 borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(50),
                     bottomRight: Radius.circular(50))),
           ),
           Column(
             children: [
               SizedBox(
                 height: 30,
               ),
               /*Text(
                 'Hello!',
                 style: TextStyle(
                     color: Colors.pink,
                     fontSize: 40,
                     fontWeight: FontWeight.w600,
                     letterSpacing: 1.2),
               ),*/
               Image.network(
                 'https://3.imimg.com/data3/LN/SM/MY-2991230/travel-software-air-bus-train-tickets-tour-packages-etc-500x500.png',
                 height: 280,
               )
             ],
           )
         ]),
         AuthForm(),
       ],
     ),
   ),
    );
  }
}

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formKey=GlobalKey<FormState>();
  /*late DBHelper helper;
  TextEditingController teSearch=TextEditingController();
  var AllAccounts=[];
  var items=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DBHelper();
    helper.allAccounts().then((users){
      setState(() {
        AllAccounts=users;
        items=AllAccounts;
      });
    });
  }
  void filterSearch(String query)async{
    var dummySearchList=AllAccounts;
    if(query.isNotEmpty)
    {
      var dummyListData =[];
      dummySearchList.forEach((item) {
        var accounts=RegisterationDatabase.fromMap(item);
        if(accounts.email.toLowerCase().contains(query.toLowerCase()))
        {
          dummyListData.add(item);
        }
      });
      setState(() {
        items=[];
        items.addAll(items);

      });
      return ;
    }
    else{
      setState(() {
        items=[];
        items=AllAccounts;
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                 TextFormField(
                 /*  validator:(email)
                {
                  if (email!=null&&!EmailValidator.validate(email))
                    {
                      if(filterSearch(email))
                        {

                        }
                    }
                }*/
                   validator:(email)=>email!=null && !EmailValidator.validate(email)
        ? 'Enter a valid email':null,

                   //controller: teSearch,
                   // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.email),
                        //border: OutlineInputBorder(),
                        labelText: 'Enter Your Email',
                        hintText: 'example@gmail.com'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!=null&& value.length<7)//????
                        {
                          return 'Enter min 7 Characters';
                        }
                    },
                   // keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Color(0xFF254390),
                        child: Text(
                          'login',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                          setState(() {
                            if(formKey.currentState!.validate()){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}
                          });
                          // Navigator.of(context).pushNamed('');
                        }),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },

                      child: Text("Don\'t have an Accont ?",
                          style: TextStyle(color: Colors.black54, fontSize: 18)))
                ],
              ),
            ))
      ],/*Container(
     margin: EdgeInsets.all(10),
   child: Column(
     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Image.network("https://3.imimg.com/data3/LN/SM/MY-2991230/travel-software-air-bus-train-tickets-tour-packages-etc-500x500.png"
         /*image: AssetImage("assets/images/flight-air-travel-package-tour-airline-ticket-travel.jpg"),
     width:double.infinity,
     height: double.infinity,
   ),*/
       ),
       Container(
         margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
         child: TextField(decoration: InputDecoration(labelText: "Email",border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple,width: 19.0),borderRadius: BorderRadius.circular(20.0)))),
       ),
       Container(
         margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
         child:  TextField(decoration: InputDecoration(labelText: "Password",border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple,width: 19.0),borderRadius: BorderRadius.circular(20.0)))),
       ),

ElevatedButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
},
    child:Text("Login",
        style: TextStyle(
            color:Colors.white)
    ),style: ElevatedButton.styleFrom(primary: Colors.deepPurple))
    ,
     ],
   )
     ,
   )*/

    );
  }
}
