import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BusScreen.dart';
import 'LoginPage.dart';
import 'Setting.dart';
import 'HomePage.dart';
import 'PaymentMethod.dart';
class BusScreen extends StatefulWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  String? valueChoose;
  String? valueChoose2;
  List citieslist = ["Cairo" ,"Alexandria" , "Luxor" , "Matruh","Sharm ElSheikh", "Dahab" ,"Suez" ,"Port Said" , "Aswan" , "Assuit","Hurghada", "Tanta" ];
  List cities2list = ["Cairo" ,"Alexandria" , "Luxor" , "Matruh","Sharm ElSheikh", "Dahab" ,"Suez" ,"Port Said" , "Aswan" , "Assuit","Hurghada", "Tanta" ];
  int counter=0;
  int price = 200;
  late DateTime mydateTime;
  late DateTime mydateTime2;

  void initState()
  {
    super.initState();
    mydateTime =DateTime.now();
    mydateTime2 =DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:Scaffold(
        appBar: AppBar(
          title: Text("Bus Booking",style: TextStyle(fontSize: 30,color: Colors.white),),
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
          toolbarHeight: 80.0,
          bottom: TabBar(
            indicatorColor: Colors.white ,
            tabs: [
              Tab(icon: Icon(Icons.arrow_right_alt_rounded),text: "One_Way" ),
              Tab(icon: Icon(Icons.compare_arrows_sharp),text: "Round Trip"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
              children: <Widget>[

                ListTile(
                  leading: Icon(Icons.person,color: Color(0xFF254390),size: 30,),
                  title: Text ('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
                    onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));}
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

              ]
          ),
        ),
        body : Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            children: [
              Container(
                margin:EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Center(
                  child: Column (
                    children:[
                      Row(
                        children: [
                          Icon(Icons.directions_bus),Text(" Departure",style: TextStyle(fontSize: 22),)
                        ],
                      ),
                      DropdownButton(
                        hint:Text("Choose Departure"),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: valueChoose,
                        onChanged: (newValue){
                          setState(() {
                            valueChoose = newValue as String?;
                          });
                        },
                        items:citieslist.map((valueItem){
                          return DropdownMenuItem(
                            value:valueItem,
                            child:Text(valueItem),
                          );
                        }).toList(),
                      ),
                      Row(
                        children: [
                          Icon(Icons.directions_bus),Text(" Destination",style: TextStyle(fontSize: 22),)
                        ],
                      ),
                      DropdownButton(
                        hint:Text("choose Destination"),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: valueChoose2,
                        onChanged: (newValue){
                          setState(() {
                            valueChoose2 = newValue as String?;
                          });
                        },
                        items:cities2list.map((valueItem2){
                          return DropdownMenuItem(
                            value:valueItem2,
                            child:Text(valueItem2),
                          );
                        }).toList(),
                      ),
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_rounded),Text(" Departure Date",style: TextStyle(fontSize: 22),)
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text("Selected Date: ${mydateTime.year},${mydateTime.month},${mydateTime.day}"),
                        onTap: _pickData,
                        trailing: Icon(Icons.arrow_drop_down),

                      ),

                      Container(
                        margin:EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          children: [
                            Icon(Icons.airplane_ticket),Text(" Number Of Tickets",style: TextStyle(fontSize: 20),)
                          ],
                        ),
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
                                        child: Icon(Icons.indeterminate_check_box,size: 43)
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
                                    child: Icon(Icons.add_box,size: 30),
                                  ),

                                ]
                            ),
                          )

                      ),
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                      Container(child:   RaisedButton(
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
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: Center(
                  child: Column (
                      children:[
                        Row(
                          children: [
                            Icon(Icons.directions_bus),Text(" Departure",style: TextStyle(fontSize: 22),)
                          ],
                        ),
                        DropdownButton(
                          hint:Text("Choose Departure"),
                          isExpanded: true,
                          underline: SizedBox(),
                          value: valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue as String?;
                            });
                          },
                          items:citieslist.map((valueItem){
                            return DropdownMenuItem(
                              value:valueItem,
                              child:Text(valueItem),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            Icon(Icons.directions_bus),Text(" Destination",style: TextStyle(fontSize: 22),)
                          ],
                        ),
                        DropdownButton(
                          hint:Text("Choose Destination"),
                          isExpanded: true,
                          underline: SizedBox(),
                          value: valueChoose2,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose2 = newValue as String?;
                            });
                          },
                          items:cities2list.map((valueItem2){
                            return DropdownMenuItem(
                              value:valueItem2,
                              child:Text(valueItem2),
                            );
                          }).toList(),
                        ),
                        Container(
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_rounded),Text(" Departure Date",style: TextStyle(fontSize: 22),)
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text("Selected Date: ${mydateTime.year},${mydateTime.month},${mydateTime.day}"),
                          onTap: _pickData,
                          trailing: Icon(Icons.arrow_drop_down),

                        ),

                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded),Text("  Return Date",style: TextStyle(fontSize: 23)),
                          ],
                        ),
                        ListTile(
                          title: Text("Selected Date: ${mydateTime2.year},${mydateTime2.month},${mydateTime2.day}"),
                          onTap: _pickData2,
                          trailing: Icon(Icons.arrow_drop_down),

                        ),
                        Container(
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                            children: [
                              Icon(Icons.airplane_ticket),Text(" Number Of Tickets",style: TextStyle(fontSize: 20),)
                            ],
                          ),
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
                                          child: Icon(Icons.indeterminate_check_box,size: 30)
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
                        Container(child:  RaisedButton(
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
                            }), /*ElevatedButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentMethod()),
                          );
                        },
                          child: Text("Confirm",style: TextStyle(fontSize: 20),),),margin:EdgeInsets.all(10) ,)*/
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
  _pickData2()async
  {
    DateTime? date= await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if (date!=null)
    {
      setState(() {
        mydateTime2=date;
      });
    }
  }
}
