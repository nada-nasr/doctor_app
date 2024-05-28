
import 'package:doctor_app/pages/assistant_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ViewDetail());
}

class ViewDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'view detials',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0C8A7D)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {
              return;
            },
            icon: const Icon(
              Icons.language,
              size: 44,
              color: Color(0xff0C8A7D),
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  const Icon(Icons.notifications);
                });
              
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 44,
                color: Color(0xff0C8A7D),
              )),
          PopupMenuButton(
              color: const Color(0xffFFFFFF),
              icon: const Icon(Icons.person),
              iconSize: 44,
              iconColor: const Color(0xff0C8A7D),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "profile",
                      child: MaterialButton(
                          child: const Row(children: [
                            Icon(
                              Icons.person,
                              color: Color(0xff0C8A7D),
                              size: 33,
                            ),
                            Text("Profile",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 26,
                                    fontWeight: FontWeight.normal)),
                          ]),
                          onPressed: () {
                            
                          }),
                    ),
                    PopupMenuItem(
                      value: "log out",
                      child: MaterialButton(
                          child: const Row(children: [
                            Icon(
                              Icons.logout,
                              color: Color(0xff0C8A7D),
                              size: 33,
                            ),
                            Text("Log out",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 26,
                                    fontWeight: FontWeight.normal)),
                          ]),
                          onPressed: () {
                            
                          }),
                    ),
                  ]),
        ],
        backgroundColor: const Color(0xffFFFFFF),
        iconTheme: const IconThemeData(
          size: 45,
          color: Color(0xFF0E725B),
        ),
      ),
    drawer: Drawer(
              backgroundColor: const Color(0xff0C8A7D),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: const Icon(Icons.menu_open),
                          iconSize: 60,
                          color: const Color(0xffFFFFFF),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    const SizedBox(height: 10),
                    DrawerListTile(
                        title: "Manage",
                        img: "images/teamwork .png",
                        press: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const Manage()));
                        }),
                    DrawerListTile(
                        title: "Archive",
                        img: "images/icon-park-outline_log.png",
                        press: () {}),
                    DrawerListTile(
                        title: "Chats",
                        img: "images/chat (1) 1.png",
                        press: () {}),
                    DrawerListTile(
                        title: "Patients",
                        img: "images/patient 1.png",
                        press: () {}),
                    DrawerListTile(
                        title: "Lab Tests",
                        img: "images/test 1.png",
                        press: () {}),
                    DrawerListTile(
                        title: "Reports",
                        img: "images/report (1) 1.png",
                        press: () {}),
                    DrawerListTile(
                        title: "Contact Us",
                        img: "images/phone.png",
                        press: () {})
                  ],
                ),
              ),
            ),
        body:ListView(
          children: [
            Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
                  child: 
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 45,
                      color: const Color(0xFF0C8A7D),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AssistantHome()));
                      },
                    ),
                ),
          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                Row(
              children: [
                  Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(horizontal: 90,vertical: 5),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xff0C8A7D))),
                      child:SharedColorTextblack(fontWeight: FontWeight.normal, text: "First time", fontSize: 30) ,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25),
                  decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
                  child: 
                  Column(
                    children: [
                      Container(
                        alignment:Alignment.center,
                        width: 660,
                        padding: EdgeInsets.all(10),
                        color: Color(0xff72CEBF),
                        child:SharedColorTextBlackBold(text: "Name") ,
                      )
                      ,
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                        height: 450,
                        width: 660,
                        child:lview(items: Patient),
                      ),
                      IconButton(
                        color: Color(0xff0C8A7D),
                        
                        onPressed: (){

                        }, 
                      icon:Icon(Icons.add_circle),iconSize: 80,)

                        ],
                      )
                      
                    ],
                  ),
                )
                  ],
                )
                ,
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(horizontal: 90,vertical: 5),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xff0C8A7D))),
                      child:SharedColorTextblack(fontWeight: FontWeight.normal, text: "Follow Up", fontSize: 30) ,
                    ),
                    Container(
                  decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
                  child: 
                  Column(
                    children: [
                      Container(
                        alignment:Alignment.center,
                        width: 660,
                        padding: EdgeInsets.all(10),
                        color: Color(0xff72CEBF),
                        child:SharedColorTextBlackBold(text: "Name") ,
                      )
                      ,
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                        height: 450,
                        width: 660,
                        child:lview(items: Patient),
                      ),
                      IconButton(
                        color: Color(0xff0C8A7D),
                        
                        onPressed: (){

                        }, 
                      icon:Icon(Icons.add_circle),iconSize: 80,)

                        ],
                      )
                      
                    ],
                  ),
                )
                  ],
                )
                
              ],
            ) ,
            )
          
          ],
        ),
            
          ],
        ) 
        ),
  

    );
  }
  
  void setState(Null Function() param0) {}
}

class lview extends StatelessWidget {
  final List items;
  const lview({
  required this.items,
  Key? key,
  }) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            color: i.isEven ? Colors.white : const Color(0xffB0E3DC),
            child: Row(
              children: [
                Image.asset("images/Group.png"),
                const SizedBox(width: 8,),
                Text(items[i])
                ],
            ),
          );
        });
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key, required this.title, required this.img, required this.press});

  final String title, img;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Image.asset(img, width: 60, height: 60),
      title: Text(title,
          style: const TextStyle(fontSize: 36, color: Color(0xffFFFFFF))),
    );
  }
}

// colorstext.........
class SharedColorTextBlackBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextBlackBold(
      {super.key,
      this.color,
      this.fontWeight = FontWeight.bold,
      required this.text,
      this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color.fromARGB(255, 0, 0, 0),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

class SharedColorTextblack extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextblack(
      {super.key,
      this.color,
      required this.fontWeight,
      required this.text,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color.fromARGB(255, 0, 0, 0),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

class SharedColorTextCADBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextCADBold(
      {super.key,
      this.color,
      this.fontWeight = FontWeight.bold,
      required this.text,
      this.fontSize = 36});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0XFF0C8A7D),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

class SharedColorTextCADnormal extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextCADnormal(
      {super.key,
      this.color,
      this.fontWeight = FontWeight.normal,
      required this.text,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0XFF0C8A7D),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

final List<String> Patient = [
  'Patient1',
  'Patient2',
  'Patient3',
  'Patient4',
  'Patient5',
  'Patient6',
  'Patient7',
  'Patient8',
  'Patient9',
  'Patient10',
];

