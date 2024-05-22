import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/Patients.dart';
import 'package:doctor_app/pages/first.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/lab_tests.dart';
import 'package:doctor_app/pages/login.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:doctor_app/pages/notification.dart';
import 'package:doctor_app/pages/reports.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});
  @override
  State<Doctors> createState() => _Doctors();
}

class _Doctors extends State<Doctors> {
  final attributes =
      ListModel(name: "Name", id: "ID", phone: "Phone", role: "Role");

  List<ListModel> DoctorList = [
    ListModel(
        name: "Nada Nasr", id: "2009001", phone: "01015678190", role: "Doctor"),
    ListModel(
        name: "Ebtehal Ahmed",
        id: "2009002",
        phone: "01015678192",
        role: "Doctor"),
    ListModel(
        name: "Manar Fawzy",
        id: "2009003",
        phone: "01015678193",
        role: "Doctor"),
    ListModel(
        name: "Rahma Anwar",
        id: "2009004",
        phone: "01015678194",
        role: "Doctor")
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
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Reports()));
                  }),
            ],
          ),
        ),
      ),
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            Container(
              child: Row(children: [
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 45,
                      color: const Color(0xFF0C8A7D),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Home()));
                      },
                    ),
                    const Text("Doctors",
                        style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 34,
                            fontWeight: FontWeight.bold))
                  ]),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Container(
                    // alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 15),
                    child: Form(
                      child: TextFormField(
                        cursorColor: const Color(0xff0C8A7D),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff0C8A7D),
                            size: 30,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 26,
                              fontWeight: FontWeight.w100),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D)),
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
              ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff72CEBF),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(attributes.name,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(attributes.id,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(attributes.phone,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(attributes.role,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
            const Divider(),
            ...DoctorList.map(
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
                            const SizedBox(width: 25),
                            MaterialButton(
                              child: SizedBox(
                                width: 300,
                                child: Row(children: [
                                  Image.asset("assets/img/profile.png",
                                      width: 30, height: 30),
                                  Text(item.name,
                                      style: const TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 36,
                                          fontWeight: FontWeight.normal))
                                ]),
                              ),
                              onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ManagerProfile()));
                                      },
                            ),
                            const SizedBox(width: 160),
                            Text(item.id,
                                style: const TextStyle(
                                    color: Color(0xff333333), fontSize: 36)),
                            const SizedBox(width: 200),
                            Text(item.phone,
                                style: const TextStyle(
                                    color: Color(0xff333333), fontSize: 36)),
                            const SizedBox(width: 230),
                            Text(item.role,
                                style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 36,
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(width: 60),
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
/////////////////////////////////////////////////////////////

class ListModel {
  ListModel(
      {required this.name,
      required this.id,
      required this.phone,
      required this.role});

  String name, id, phone, role;
}

class MySearchDelegate extends SearchDelegate {
  List suggestions = [
    "Nada",
    "Ebtehal",
    "Manar",
    "Rahma"
  ]; //المفروض من الداتابيز

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
    return const ManagerProfile(); //غالبا هيبقى البروفايل بتاع الشخص اللي اختارته
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


