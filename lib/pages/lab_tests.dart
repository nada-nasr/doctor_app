import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/Patients.dart';
import 'package:doctor_app/pages/first.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/login.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:doctor_app/pages/notification.dart';
import 'package:doctor_app/pages/reports.dart';
import 'package:flutter/material.dart';

class LabTests extends StatefulWidget {
  const LabTests({super.key});
  @override
  State<LabTests> createState() => _LabTests();
}

class _LabTests extends State<LabTests> {
  int selectedIndex = -1;
  int index = 0;
  TextEditingController patientnameController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();

  


  final attributes = ListModel(
      patientname: 'Patients',
      doctorname: 'Doctor',
      addedby: 'Added By',
      date: 'Date',
      result: 'Result',
      action: 'Action');

  List<ListModel> LabTests = [
    ListModel(
        patientname: 'Menna Ali',
        doctorname: 'Nada Nasr',
        addedby: 'Mai Samy',
        date: '19/4',
        result: '+ve',
        action: "action")
  ];

  List tests1 = [
    {"Test details": "PEMO", "Result": 16.3},
    {"Test details": "PCV", "Result": 16.3},
    {"Test details": "WBC", "Result": 16.3},
    {"Test details": "BP", "Result": 16.3},
    {"Test details": "BGR", "Result": 16.3},
    {"Test details": "BU", "Result": 16.3},
    {"Test details": "SC", "Result": 16.3},
    {"Test details": "SOD", "Result": 16.3},
    {"Test details": "SG", "Result": 16.3},
    {"Test details": "AL", "Result": 16.3},
    {"Test details": "SU", "Result": 16.3},
  ];
  List tests2 = [
    {"Test details": "POT", "Result": "Normal"},
    {"Test details": "RBC", "Result": "Abnormal"},
    {"Test details": "PC", "Result": "Normal"},
    {"Test details": "PCC", "Result": "Normal"},
    {"Test details": "PA", "Result": "Normal"},
    {"Test details": "HTN", "Result": "Normal"},
    {"Test details": "DM", "Result": "Normal"},
    {"Test details": "CAD", "Result": "Normal"},
    {"Test details": "PE", "Result": "Normal"},
    {"Test details": "ANE", "Result": "Normal"},
    {"Test details": "APPET", "Result": "Normal"},
  ];

  void editlabTests(int index) {
    var LabTest = LabTests[index];
    patientnameController.text = LabTest.patientname;
    doctorController.text = LabTest.doctorname;
    addController.text = LabTest.addedby;
    resultController.text = LabTest.result;
    dateController.text = LabTest.date;

    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextField(
                          controller: patientnameController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                              labelText: "Patient Name",
                              labelStyle: TextStyle(
                                  color: Color(0xff0C8A7D), fontSize: 18),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D)))),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        TextField(
                          controller: doctorController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                              labelText: "Doctor Name",
                              labelStyle: TextStyle(
                                  color: Color(0xff0C8A7D), fontSize: 18),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D)))),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        TextField(
                          controller: addController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                              labelText: "Added By",
                              labelStyle: TextStyle(
                                  color: Color(0xff0C8A7D), fontSize: 18),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D)))),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        TextField(
                          controller: resultController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                              labelText: "Result",
                              labelStyle: TextStyle(
                                  color: Color(0xff0C8A7D), fontSize: 18),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D)))),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        TextField(
                          controller: dateController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                              labelText: "Date",
                              labelStyle: TextStyle(
                                  color: Color(0xff0C8A7D), fontSize: 18),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0C8A7D)))),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ]),
                ),
                MaterialButton(
                    child: const Text("Update",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (patientnameController.text.isEmpty ||
                          doctorController.text.isEmpty ||
                          addController.text.isEmpty ||
                          resultController.text.isEmpty ||
                          dateController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill',
                                  style: TextStyle(color: Color(0xffFFFFFF)))),
                        );
                        return;
                      }
                      setState(() {
                        LabTests[index] = ListModel(
                          patientname: patientnameController.text,
                          doctorname: doctorController.text,
                          addedby: addController.text,
                          result: resultController.text,
                          date: dateController.text,
                          action: 'action',
                        );
                      });
                      Navigator.pop(context);
                    })
              ],
            ));
  }

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
                  press: () {}),
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
                    const Text("Lab Tests",
                        style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 32,
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
                            size: 32,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const SizedBox(width: 70),
                  Text(attributes.patientname,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 130),
                  Text(attributes.doctorname,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 130),
                  Text(attributes.addedby,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 135),
                  Text(attributes.date,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 130),
                  Text(attributes.result,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 130),
                  Text(attributes.action,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
            const Divider(),
            ...LabTests.map(
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
                            const SizedBox(width: 50),
                            Text(item.patientname,
                                style: const TextStyle(
                                    color: Color(0xff333333), fontSize: 36)),
                            const SizedBox(width: 95),
                            Text(item.doctorname,
                                style: const TextStyle(
                                    color: Color(0xff333333), fontSize: 36)),
                            const SizedBox(width: 105),
                            Text(item.addedby,
                                style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 36,
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(width: 145),
                            Text(item.date,
                                style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 36,
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(width: 150),
                            Text(item.result,
                                style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 36,
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(width: 120),
                            Container(
                              child: Row(children: [
                                MaterialButton(
                                    child: Image.asset(
                                      "assets/img/share (1) 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor:
                                                const Color(0xffFFFFFF),
                                            content: Expanded(
                                                child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: SingleChildScrollView(
                                                child: Column(children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                        icon: const Icon(
                                                            Icons.clear),
                                                        color: const Color(
                                                            0xff0C8A7D),
                                                        iconSize: 30,
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(children: [
                                                        //col1
                                                        Column(children: [
                                                          Row(children: [
                                                            Container(
                                                              width: 180,
                                                              //color: Colors.black,
                                                              child: const Text(
                                                                  "Patient name",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Color(
                                                                          0xff096B61),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          15,
                                                                      top: 14),
                                                              child: Container(
                                                                width: 450,
                                                                height: 44,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        color: const Color(
                                                                            0xff096B61))),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                child: const Text(
                                                                    "Mohamed Nasr",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          20,
                                                                    )),
                                                              ),
                                                            )
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: 180,
                                                              //color: Colors.black,
                                                              child: const Text(
                                                                  "Patient info",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Color(
                                                                          0xff096B61),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              width: 450,
                                                              height: 45,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      color: const Color(
                                                                          0xff096B61))),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15,
                                                                      top: 5,
                                                                      bottom:
                                                                          5),
                                                              child: const Text(
                                                                  "Male_30 Years",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff000000),
                                                                    fontSize:
                                                                        20,
                                                                  )),
                                                            )
                                                          ]),
                                                          Row(children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 9),
                                                              child: Container(
                                                                width: 180,
                                                                //color: Colors.black,
                                                                child: const Text(
                                                                    "Patient ID",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            30,
                                                                        color: Color(
                                                                            0xff096B61),
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15),
                                                              child: Container(
                                                                width: 450,
                                                                height: 45,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        color: const Color(
                                                                            0xff096B61))),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                child: const Text(
                                                                    "1234556",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          20,
                                                                    )),
                                                              ),
                                                            )
                                                          ]),
                                                        ]),
                                                        const SizedBox(
                                                            width: 50),
                                                        //col2
                                                        Column(children: [
                                                          Row(children: [
                                                            Container(
                                                              width: 180,
                                                              //color: Colors.black,
                                                              child: const Text(
                                                                  "Doctor name",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Color(
                                                                          0xff096B61),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          15,
                                                                      top: 14),
                                                              child: Container(
                                                                width: 450,
                                                                height: 44,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        color: const Color(
                                                                            0xff096B61))),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                child: const Text(
                                                                    "Nada Nasr",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          20,
                                                                    )),
                                                              ),
                                                            )
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: 180,
                                                              //color: Colors.black,
                                                              child: const Text(
                                                                  "Date",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Color(
                                                                          0xff096B61),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              width: 450,
                                                              height: 45,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      color: const Color(
                                                                          0xff096B61))),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15,
                                                                      top: 5,
                                                                      bottom:
                                                                          5),
                                                              child: const Text(
                                                                  "15/05/2024",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff000000),
                                                                    fontSize:
                                                                        20,
                                                                  )),
                                                            )
                                                          ]),
                                                          Row(children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 9),
                                                              child: Container(
                                                                width: 180,
                                                                //color: Colors.black,
                                                                child: const Text(
                                                                    "Class",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            30,
                                                                        color: Color(
                                                                            0xff096B61),
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15),
                                                              child: Container(
                                                                width: 450,
                                                                height: 45,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        color: const Color(
                                                                            0xff096B61))),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                child: const Text(
                                                                    ".........",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          20,
                                                                    )),
                                                              ),
                                                            )
                                                          ]),
                                                        ])
                                                      ]),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Divider(
                                                      color: Color(0xff096B61)),
                                                  Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(children: [
                                                        //col1
                                                        Column(children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Container(
                                                              width: 500,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      color: const Color(
                                                                          0xff096B61))),
                                                              child: const Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                        "Test details",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    Text(
                                                                        "Result",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400))
                                                                  ]),
                                                            ),
                                                          ),
                                                          ...List.generate(
                                                              tests1.length,
                                                              (index) {
                                                            return Container(
                                                              child: Row(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          100,
                                                                      child: Text(
                                                                          tests1[index]
                                                                              [
                                                                              "Test details"],
                                                                          style: const TextStyle(
                                                                              color: Color(0xff000000),
                                                                              fontSize: 32,
                                                                              fontWeight: FontWeight.w400)),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            70),
                                                                    const Text(
                                                                        ":",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    const SizedBox(
                                                                        width:
                                                                            90),
                                                                    Container(
                                                                      width: 60,
                                                                      child: Text(
                                                                          "$index",
                                                                          style: const TextStyle(
                                                                              color: Color(0xff000000),
                                                                              fontSize: 32,
                                                                              fontWeight: FontWeight.w400)),
                                                                    )
                                                                  ]),
                                                            );
                                                          }),
                                                        ]),
                                                        const SizedBox(
                                                            width: 200),
                                                        //col2
                                                        Column(children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Container(
                                                              width: 500,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      color: const Color(
                                                                          0xff096B61))),
                                                              child: const Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                        "Test details",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    Text(
                                                                        "Result",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400))
                                                                  ]),
                                                            ),
                                                          ),
                                                          ...List.generate(
                                                              tests2.length,
                                                              (index) {
                                                            return Container(
                                                              child: Row(
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            100),
                                                                    Container(
                                                                      width:
                                                                          100,
                                                                      child: Text(
                                                                          tests2[index]
                                                                              [
                                                                              "Test details"],
                                                                          style: const TextStyle(
                                                                              color: Color(0xff000000),
                                                                              fontSize: 32,
                                                                              fontWeight: FontWeight.w400)),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            70),
                                                                    const Text(
                                                                        ":",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000000),
                                                                            fontSize:
                                                                                32,
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    const SizedBox(
                                                                        width:
                                                                            90),
                                                                    Container(
                                                                      width:
                                                                          200,
                                                                      child: Text(
                                                                          tests2[index]
                                                                              [
                                                                              "Result"],
                                                                          style: const TextStyle(
                                                                              color: Color(0xff000000),
                                                                              fontSize: 32,
                                                                              fontWeight: FontWeight.w400)),
                                                                    )
                                                                  ]),
                                                            );
                                                          }),
                                                        ]),
                                                      ]),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            )),
                                          );
                                        },
                                      );
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    iconSize: 50,
                                    color: const Color(0xff0C8A7D),
                                    onPressed: () {
                                      editlabTests(index);
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    iconSize: 50,
                                    color: const Color(0xff0C8A7D),
                                    onPressed: () {
                                      setState(() {
                                        LabTests.removeAt(
                                            LabTests.indexOf(item));
                                      });
                                    })
                              ]),
                            ),
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
      {required this.patientname,
      required this.doctorname,
      required this.addedby,
      required this.date,
      required this.result,
      required this.action});

  String patientname, doctorname, addedby, date, result, action;
}

class MySearchDelegate extends SearchDelegate {
  List suggestions = []; //المفروض من الداتابيز

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
