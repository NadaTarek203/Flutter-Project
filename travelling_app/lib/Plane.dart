import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PaymentMethod.dart';
import 'HomePage.dart';
import 'Setting.dart';
import 'LoginPage.dart';
class Plane extends StatefulWidget {
  const Plane({Key? key}) : super(key: key);

  @override
  _PlaneState createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  int counter=0;
  int price = 200;
  late DateTime mydateTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydateTime=DateTime.now();
  }
  final Classes=["Business Class","First Class","Second Class","Third Class"];
  final items=["Amman","Abu Dhabi","Australia","Angola","Afghanistan","Brazil","Bangladesh","Bulgaria","Bulgaria","China","Colombia","Canada","Cameroon","Cuba","Egypt"];
  String? Deptvalue;
  String?DestValue;
  String? Class;
  //String valueChoose;
 // List DepartureList=["Amman","Abu Dhabi","Australia","Angola","Afghanistan","Brazil","Bangladesh","Bulgaria","Bulgaria","China","Colombia","Canada","Cameroon","Cuba"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:2,
        child:Scaffold(
          appBar: AppBar(
            title: Text("Plane Booking",style: TextStyle(fontSize: 30,color: Colors.white),),
            centerTitle: true,
            //backgroundColor: Colors.blueGrey,
     flexibleSpace: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [Color(0xFFC7CAE5),Color(0xFF9CB2EA),Color(0xFF5C74B3),Color(0xFF254390)],
           begin: Alignment.centerLeft,
         )
       ),
     ),
     bottom: TabBar(
       indicatorColor: Colors.white ,
       tabs: [
         Tab(icon: Icon(Icons.arrow_right_alt_rounded),text: "One_Way" ),
         Tab(icon: Icon(Icons.compare_arrows_sharp),text: "RoundTrip",),
       ],
     ),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[

                ListTile(
                  leading: Icon(Icons.person,color: Color(0xFF254390),size: 30,),
                  title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),

                ),
                ListTile(
                    leading: Icon(Icons.home,color:  Color(0xFF254390),size: 30,),
                    title: Text ('Home',style: TextStyle(fontSize: 20),),
                    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}),

                ListTile(
                    leading: Icon(Icons.settings,color: Color(0xFF254390),size: 30,),
                    title: Text ('Setting',style: TextStyle(fontSize: 20),),
                    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Setting()));}),

                ListTile(
                    leading: Icon(Icons.vpn_key_outlined,color:  Color(0xFF254390),size: 30,),
                    title: Text ('LogOut',style: TextStyle(fontSize: 20,),),
                    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));}),
              ],
            ),
          ),
          body: TabBarView(
            children: [
             Center(
               child: Container(
                 margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                   child:Column(
                     children: [
                       Row(
                         children: [
                           Icon(Icons.airplanemode_active),Text("  Departure",style: TextStyle(fontSize: 23),),
                         ],
                       ),
                       Center(
                         child:  DropdownButton<String>(
                           value: Deptvalue,
                           hint:Text("Choose Departure") ,
                           isExpanded: true,
                           iconSize: 36,
                           icon: Icon(Icons.arrow_drop_down),
                           items: items.map(buildMenuItem).toList() ,
                           onChanged: (value)=>setState(()=>this.Deptvalue=value),
                         ),
                       ),
                       SizedBox(height: 5,),
                       Row(
                         children: [
                           Icon(Icons.airplanemode_active),Text("  Destination",style: TextStyle(fontSize: 23)),
                         ],
                       ),
                       Center(
                         child:  DropdownButton<String>(
                           value: DestValue,
                           hint:Text("Choose Departure") ,
                           isExpanded: true,
                           iconSize: 36,
                           icon: Icon(Icons.arrow_drop_down),
                           items: items.map(buildMenuItem).toList() ,
                           onChanged: (value)=>setState(()=>this.DestValue=value),
                         ),
                       ), SizedBox(height: 5,),
                       Row(
                         children: [
                           Icon(Icons.date_range),Text("  Departure Date",style: TextStyle(fontSize: 23)),
                         ],
                       ),

                       ListTile(
                         title: Text("Selected Date: ${mydateTime.year},${mydateTime.month},${mydateTime.day}",style: TextStyle(color: Colors.black54),),
                         onTap: _pickData,
                         trailing: Icon(Icons.arrow_drop_down),

                       ), SizedBox(height: 5,),
                       Row(
                         children: [
                           Icon(Icons.shopping_bag),Text("  Cabin Class",style: TextStyle(fontSize: 23),),
                         ],
                       ),
                       Center(
                         child:  DropdownButton<String>(
                           value: Class,
                           hint:Text("Select Class") ,
                           isExpanded: true,
                           iconSize: 36,
                           icon: Icon(Icons.arrow_drop_down),
                           items: Classes.map(buildMenuItem).toList() ,
                           onChanged: (value)=>setState(()=>this.Class=value),
                         ),
                       ), SizedBox(height: 5,),
                       Row(
                         children: [
                           Icon(Icons.airplane_ticket),Text("  Number Of Tickets",style: TextStyle(fontSize: 23
                           ),),

                         ],
                       ),
               Center(
                   child:Container(
                     margin:EdgeInsets.all(10),
                     child: Row(
                         children: [
                           if(counter>0)
                             ElevatedButton(
                                 onPressed:() {
                                   setState(() {
                                     counter--;
                                   });
                                 },
                                 child: Icon(Icons.indeterminate_check_box,size: 25)
                             ),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Text(counter.toString(),style: TextStyle(fontSize: 22)),
                           ),
                           ElevatedButton(
                             onPressed:(){
                               setState(() {
                                 counter++;
                               });
                             },
                             child: Icon(Icons.add_box,size: 25),
                           ),
                         ]
                     ),
                   )

                       ), Container(
                         margin:EdgeInsets.fromLTRB(0, 10, 0, 10),
                         child: Row(
                           children: [
                             Icon(Icons.price_change),Text(" Price ---> ",style: TextStyle(fontSize: 22)),
                             Column(
                               children: [
                                 Text((price*counter).toString(),style: TextStyle(fontSize: 22),),
                               ],
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: 5,),

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
                     ],

                   )
               ),
             ) ,
              Center(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.airplanemode_active),Text("  Departure",style: TextStyle(fontSize: 23),),
                        ],
                      ),Center(
                        child:  DropdownButton<String>(
                          value: Deptvalue,
                          hint:Text("Choose Departure") ,
                          isExpanded: true,
                          iconSize: 36,
                          icon: Icon(Icons.arrow_drop_down),
                          items: items.map(buildMenuItem).toList() ,
                          onChanged: (value)=>setState(()=>this.Deptvalue=value),
                        ),
                      ), SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.airplanemode_active),Text("  Destination",style: TextStyle(fontSize: 23)),
                        ],
                      ),
                      Center(
                        child:  DropdownButton<String>(
                          value: DestValue,
                          hint:Text("Choose Departure") ,
                          isExpanded: true,
                          iconSize: 36,
                          icon: Icon(Icons.arrow_drop_down),
                          items: items.map(buildMenuItem).toList() ,
                          onChanged: (value)=>setState(()=>this.DestValue=value),
                        ),
                      ), SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.date_range),Text("  Departure Date",style: TextStyle(fontSize: 23)),
                        ],
                      ),

                      ListTile(
                        title: Text("Selected Date: ${mydateTime.year},${mydateTime.month},${mydateTime.day}"),
                        onTap: _pickData,
                        trailing: Icon(Icons.arrow_drop_down),

                      ), SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.date_range),Text("  Return Date",style: TextStyle(fontSize: 23)),
                        ],
                      ),

                      ListTile(
                        title: Text("Selected Date: ${mydateTime.year},${mydateTime.month},${mydateTime.day}"),
                        onTap: _pickData,
                        trailing: Icon(Icons.arrow_drop_down),

                      ), SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.shopping_bag),Text("  Cabin Class",style: TextStyle(fontSize: 23),),
                        ],
                      ),
                      Center(
                        child:  DropdownButton<String>(
                          value: Class,
                          hint:Text("Select Class") ,
                          isExpanded: true,
                          iconSize: 36,
                          icon: Icon(Icons.arrow_drop_down),
                          items: Classes.map(buildMenuItem).toList() ,
                          onChanged: (value)=>setState(()=>this.Class=value),
                        ),
                      ), SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.airplane_ticket),Text("  Number Of Tickets",style: TextStyle(fontSize: 23),),
                        ],
                      ),
                      Center(
                          child:Container(
                            margin:EdgeInsets.all(5),
                            child: Row(
                                children: [
                                  if(counter>0)
                                    ElevatedButton(
                                        onPressed:() {
                                          setState(() {
                                            counter--;
                                          });
                                        },
                                        child: Icon(Icons.indeterminate_check_box,size: 30)
                                    ),

                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(counter.toString(),style: TextStyle(fontSize: 22)),
                                  ),
                                  ElevatedButton(
                                    onPressed:(){
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    child: Icon(Icons.add_box,size: 30),
                                  ),

                                ]
                            ),
                          )

                      ),
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 5, 0, 4),
                        child: Row(
                          children: [
                            Icon(Icons.price_change),Text(" Price ---> ",style: TextStyle(fontSize: 22)),
                            Column(
                              children: [
                                Text((price*counter).toString(),style: TextStyle(fontSize: 22),),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5,),
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
                          }),//ElevatedButton(onPressed: onPressed, child: child)
                    ],

                  )
              ),
            ],
          ),

        )

    );

  }
  DropdownMenuItem<String> buildMenuItem(String item) =>DropdownMenuItem(
      value: item,
      child: Text(
        item,style: TextStyle(fontSize: 20),
      )
  );
  _pickData()async

  {
    DateTime? date= await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if (date!=null)
    {
      setState(() {
        mydateTime=date;
      });
    }
  }
}
