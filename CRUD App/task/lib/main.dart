import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/userClass.dart';
import 'package:task/userData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child:Text("View All Users"),
                  onPressed:(){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>SelectPage()));
                  }
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  child:Text("Create New User"),
                  onPressed:(){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>CreateUserPage()));
                  }
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  child:Text("Update User"),
                  onPressed:(){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpdatePage()));
                  }
              ),

              SizedBox(height: 40,),
            ],
          ),
        )
    );
  }
}
class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  //final Username=TextEditingController();
  List<userClass> users=[];
  Future<void> DeleteUser(String id) async{
    String token = "f5f9a8ea4b1f0312f4c4beb8debf71715a7f69d218cf65fbc187e522f998a2ff";
    var dio= Dio();
    dio.options.headers["Authorization"]="Bearer ${token}";
    var response= await dio.delete("https://gorest.co.in/public/v2/users/$id");
    print(response.statusCode);
  }
  Future<void>getAllUsers()async{
   // String name=get();
    //print(name);
    var response=await Dio().get("https://gorest.co.in/public/v2/users");
    if (response.statusCode==200)
      {
        for(var user in response.data){
          setState(() {
            users.add(userClass.fromJson(user));
          });
        }
      }
    print(users);
  }
  @override
  void initState() {
    getAllUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("List Of Users",style: TextStyle(fontSize: 28,color: Colors.indigo,),),
            SizedBox(height: 40,),
            getList()
            //ElevatedButton(onPressed:getAllUsers, child: Text("select"))
          ]
        ),

      )
    );
  }
  Widget getList(){
    return Expanded(
        child:ListView.builder(
          itemCount: users.length,
          itemBuilder: ( context, index){
            return Card(
                   child: Column(
                     children: [
                       Row(
                         children: [
                          Text("User ID: "),
                          Text(users[index].id.toString()),
                         ],
                       ),
                       Center(
                         child: Row(
                           children: [
                             Text("User Name: ")
                             ,Text(users[index].name.toString()
                             ),
                           ],
                         )
                       ),
                       Row(
                         children: [
                           Text("User Email: "),
                           Text(users[index].email.toString()),
                         ],
                       ),
                       Row(
                         children: [
                         ElevatedButton(onPressed: (){DeleteUser(users[index].id.toString());}, child: Text("Delete"))
                         ],
                       )
                     ],
                   ),
            );
          },
        )
    );

  }
}
class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  late userClass userDate;
  TextEditingController Username=TextEditingController();
  TextEditingController Emial=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController Status=TextEditingController();
  Future<userClass> Createuser(String name,String email,String gender,String status) async{
    String token = "f5f9a8ea4b1f0312f4c4beb8debf71715a7f69d218cf65fbc187e522f998a2ff";
    var dio= Dio();
    dio.options.headers["Authorization"]="Bearer ${token}";
    var response= await dio.post("https://gorest.co.in/public/v2/users",data: {'name':name,'email':email,'gender':gender,'status':status});
    print(response.data);
    return userClass.fromJson(response.data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Create New User",style: TextStyle(fontSize: 28,color: Colors.indigo,),),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "User Name"),

                controller: Username,
              ),SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Email"),

                controller: Emial,
              ),SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Gender"),

                controller: Gender,
              ),SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Status"),

                controller: Status,
              ),SizedBox(height: 50,),
              ElevatedButton(onPressed:() async{
                String name=Username.text;
                String email=Emial.text;
                String gender=Gender.text;
                String status=Status.text;
                userClass data= Createuser(name, email, gender, status) as userClass;
                setState(() {
                  userDate=data;
                });
              }, child: Text("Create"))
            ],
          ),
        ),
    );
  }
}

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late userClass userdate;
  TextEditingController UserId=TextEditingController();
  TextEditingController Username=TextEditingController();
  TextEditingController Email=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController Status=TextEditingController();
  Future<userClass> UpdateUser(String id,String name,String email,String gender,String status) async{
    String token = "f5f9a8ea4b1f0312f4c4beb8debf71715a7f69d218cf65fbc187e522f998a2ff";
    var dio= Dio();
    final data={
      'name':name,
      'email':email,
      'gender':gender,
      'status':status
    };
    dio.options.headers["Authorization"]="Bearer ${token}";
    var response= await dio.put("https://gorest.co.in/public/v2/users/$id",data: data);
    print(response.data);
    return userClass.fromJson(response.data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Update User",style: TextStyle(fontSize: 28,color: Colors.indigo,),),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "User ID"),
            controller: UserId,
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "User Name"),

            controller: Username,
          ),SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Email"),

            controller: Email,
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Gender"),

            controller: Gender,
          ),SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Status"),

            controller: Status,
          ),
          SizedBox(height: 50,),
          ElevatedButton(onPressed:() async{
            String name=Username.text;
            String email=Email.text;
            String gender=Gender.text;
            String status=Status.text;
            String id=UserId.text;
            Future<userClass> data= UpdateUser(id,name, email, gender, status) ;
            setState(() {
              userdate=data as userClass;
            });
          }, child: Text("Update"))
        ],
      ),

    );
  }

}
class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  void DeleteUser() async{
    String token = "f5f9a8ea4b1f0312f4c4beb8debf71715a7f69d218cf65fbc187e522f998a2ff";
    var dio= Dio();
    dio.options.headers["Authorization"]="Bearer ${token}";
    var response= await dio.delete("https://gorest.co.in/public/v2/users/1431");
    print(response.statusCode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Delete User"),

          ElevatedButton(child: Text("Delete"), onPressed:DeleteUser)
        ],
      ),

    );
  }
}


