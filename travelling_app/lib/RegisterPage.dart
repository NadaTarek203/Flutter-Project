import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/DBHelper.dart';
import 'package:travelling_app/LoginPage.dart';
import 'package:travelling_app/RegisterationDatabase.dart';
//import 'package:myfirstapp/started';
//import 'package:myfirstapp/login_register';
class RegisterPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                 Image(image: AssetImage("assets/images/online-app-tourism-traveler-with-mobile-phone-passport-booking-buying-plane-ticket_74855-10966 (1).webp",),height: 280,)
                ],
              )
            ]),
            AuthForm1(),
          ],
        ),
      ),
    );
  }
}
class AuthForm1 extends StatefulWidget {
  @override
  _AuthForm1State createState() => _AuthForm1State();
}
class _AuthForm1State extends State<AuthForm1> {
  late String Email;
  late String Pass,conPass;
  late DBHelper helper;
  void initState(){
    super.initState();
    helper=DBHelper();
  }
  final formKey=GlobalKey<FormState>();
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
                  validator:(email)=>email!=null && !EmailValidator.validate(email)
                ? 'Enter a valid email':null,
      // keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration( prefixIcon: Icon(Icons.email),
                        labelText: 'Enter Your Email',
                        hintText: 'example@gmail.com'),
                    onChanged: (value){
                    setState((){
                      Email=value;
                    });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!=null&& value.length<7)//????
                          {
                        return 'Enter min 7 Characters';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Enter Your Password',
                    ),
                    obscureText: true,
                    onChanged: (value){
                      setState((){Pass=value;}
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!=null&& value.length<7)//????
                          {
                        return 'Enter min 7 Characters';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: ' Confirm Your Password',
                    ),
                    obscureText: true,
                    onChanged: (value){
                      setState((){
                        conPass=value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Color(0xFF254390),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                         // RegisterationDatabase usersAccounts=RegisterationDatabase({'email':Email,'pass':Pass,'conPass':conPass});
                          //int email=await helper.createAccount(usersAccounts);//????
                          setState(() {
                            if(formKey.currentState!.validate()){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}
                          });
                        }),
                  ),
                  ],
              ),
            ))
      ],
    );
  }
}