import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/Patients.dart';
import 'package:doctor_app/pages/first.dart';
import 'package:doctor_app/pages/generate_report.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/lab_tests.dart';
import 'package:doctor_app/pages/login.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:doctor_app/pages/notification.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});
  @override
  State<Reports> createState() => _Reports();
}

class _Reports extends State<Reports> {
  final attributes = ListModel(
      PatientName: 'PatientName',
      date: 'Date',
      ConcernedAuthority: 'ConcernedAuthority',
      DoctorName: 'Doctor',
      AssistantName: 'Assistant');
  List<ListModel> Reports = [
    ListModel(
        PatientName: "Menna Ali ",
        date: '19/4',
        ConcernedAuthority: 'Petro Company',
        DoctorName: 'Nada Nasr',
        AssistantName: 'Heba Mohamed'),
    ListModel(
        PatientName: "Asma Nasr",
        date: '20/4',
        ConcernedAuthority: 'PTSC Company',
        DoctorName: 'Menna Ehab',
        AssistantName: 'menna Ali'),
    ListModel(
        PatientName: 'Mona Said',
        date: '21/4',
        ConcernedAuthority: 'CPC Company   ',
        DoctorName: 'Ali Samy    ',
        AssistantName: 'Soha Ayman',
        
        )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  const Icon(Icons.notifications);
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Notifications()));
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ManagerProfile()));
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
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
                  img: "assets/img/teamwork .png",
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Manage()));
                  }),
              DrawerListTile(
                  title: "Archive",
                  img: "assets/img/icon-park-outline_log.png",
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const First()));
                  }),
            
              DrawerListTile(
                  title: "Patients",
                  img: "assets/img/patient 1.png",
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Patients()));
                  }),
              DrawerListTile(
                  title: "Lab Tests",
                  img: "assets/img/test 1.png",
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LabTests()));
                  }),
              DrawerListTile(
                  title: "Reports",
                  img: "assets/img/report (1) 1.png",
                  press: () {}),
              
            ],
          ),
        ),
      ),
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          //width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            Container(
              child: Column(children: [
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 40,
                      color: const Color(0xFF0C8A7D),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Home()));
                      },
                    ),
                    const Text("Reports",
                        style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 30,
                            fontWeight: FontWeight.bold))
                  ]),
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 15),
                      child: Form(
                        child: TextFormField(
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff0C8A7D),
                              size: 28,
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Color(0xff0C8A7D),
                                fontSize: 26,
                                fontWeight: FontWeight.w100),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          onTap: () {
                            showSearch(
                                context: context, delegate: MySearchDelegate());
                          },
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Expanded(
                          child: buildGenerateReportButton(context)
                        ),
                      ),
                    ),
                
                ]),
              ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff72CEBF),
                    borderRadius: BorderRadius.circular(10)),
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 50),
                          Text(attributes.PatientName,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 105),
                          Text(attributes.date,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 98),
                          Text(attributes.ConcernedAuthority,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 100),
                          Text(attributes.DoctorName,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 140),
                          Text(attributes.AssistantName,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                ),
              ),
            ),
            const Divider(),
            ...Reports.map(
              (item) => Expanded(
                child: Card(
                  color: const Color(0xffFFFFFF),
                  child: Expanded(
                    child: Container(
                      color: const Color(0xffFFFFFF),
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            const SizedBox(width: 60),
                            Text(item.PatientName,
                                style: const TextStyle(
                                    color: Color(0xff000000), fontSize: 36)),
                            const SizedBox(width: 150),
                            Text(item.date,
                                style: const TextStyle(
                                    color: Color(0xff000000), fontSize: 36)),
                            const SizedBox(width: 120),
                            Text(item.ConcernedAuthority,
                                style: const TextStyle(
                                    color: Color(0xff000000), fontSize: 36)),
                            const SizedBox(width: 150),
                            Text(item.DoctorName,
                                style: const TextStyle(
                                    color: Color(0xff000000), fontSize: 36)),
                            const SizedBox(width: 80),
                            Text(item.AssistantName,
                                style: const TextStyle(
                                    color: Color(0xff000000), fontSize: 36)),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
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

class MySearchDelegate extends SearchDelegate {
  List suggestions = []; 

  List? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
              icon: const Icon(Icons.close),
              color: const Color(0xff0C8A7D),
              onPressed: () {
                query = "";
              }),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back),
      color: const Color(0xff0C8A7D),
      onPressed: () {
        close(context, null);
      });

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Result"); //غالبا هيبقى البروفايل بتاع الشخص اللي اختارته
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                  color: const Color(0xffFFFFFF),
                  child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        "${suggestions[i]}",
                        style: const TextStyle(fontSize: 30),
                      ))),
            );
          });
    } else {
      filterList =
          suggestions.where((element) => element.startsWith(query)).toList();
      return ListView.builder(
          itemCount: filterList!.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                  color: const Color(0xffFFFFFF),
                  child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        "${filterList![i]}",
                        style: const TextStyle(fontSize: 30),
                      ))),
            );
          });
    }
  }
}

class ListModel {
  ListModel(
      {required this.PatientName,
      required this.date,
      required this.ConcernedAuthority,
      required this.DoctorName,
      required this.AssistantName});

  String PatientName, date, ConcernedAuthority, DoctorName, AssistantName;
}

Widget buildGenerateReportButton(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: 100,
    width: 320,
    padding: EdgeInsets.all(5),
    margin: const EdgeInsets.only(right: 30),
    child: Material(
      elevation: 3,
      shadowColor: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: MaterialButton(
          height: 40,
          color: Colors.white,
          hoverColor: const Color.fromARGB(186, 179, 213, 209),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Generatereport()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                              "Generate report",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
              Image.asset(
                "images/arrow.png",
                height: 40,
                width: 35,
              )
            ],
          ),
        ),
      ),
    ),
  );
}



