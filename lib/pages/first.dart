// ignore_for_file: use_build_context_synchronously, avoid_unnecessary_containers, deprecated_member_use, non_constant_identifier_names, unused_import, unnecessary_import

import 'dart:developer';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/Patients.dart';
import 'package:doctor_app/pages/Reservation.dart';
import 'package:doctor_app/pages/followup.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/lab_tests.dart';
import 'package:doctor_app/pages/patient_profile.dart';
import 'package:doctor_app/pages/reports.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List<String> items = ["Appointment archive", "Medicine archive"];
  int selectedIndex = -1;
  int index = 0;
  TextEditingController medicationnameController = TextEditingController();
  TextEditingController dosageformController = TextEditingController();
  TextEditingController manufacturerController = TextEditingController();
  TextEditingController genericnameController = TextEditingController();
  TextEditingController therapeuticController = TextEditingController();

  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("medicationName", medicationnameController.text);
    sharedPreferences.setString("dosageForm", dosageformController.text);
    sharedPreferences.setString("manufacturer", manufacturerController.text);
    sharedPreferences.setString("genericName", genericnameController.text);
    sharedPreferences.setString("therapeuticClass", therapeuticController.text);
    
  }

  final attributes = ListModel(
      medicationName: 'Medication name',
      dosageForm: 'Dosage form',
      manufacturer: 'Manufacturer',
      genericName: 'Generic name',
      therapeuticClass: 'Therapeutic class',
      action: 'Action');
  List<ListModel> Medicines = [
    ListModel(
        medicationName: 'Medication name',
        dosageForm: 'Dosage form',
        manufacturer: 'Manufacturer',
        genericName: 'Generic name',
        therapeuticClass: 'Therapeutic class',
        action: 'action')
  ];

  void editMedicine(int index) {
    var medicine = Medicines[index]; // Get the patient to edit
    medicationnameController.text = medicine.medicationName;
    dosageformController.text = medicine.dosageForm;
    manufacturerController.text = medicine.manufacturer;
    genericnameController.text = medicine.genericName;
    therapeuticController.text = medicine.therapeuticClass;

    showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: medicationnameController,
                        cursorColor: const Color(0xff0C8A7D),
                        decoration: const InputDecoration(
                            labelText: "medicationName",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)))),
                      ),
                      TextField(
                        cursorColor: const Color(0xff0C8A7D),
                        controller: dosageformController,
                        decoration: const InputDecoration(
                            labelText: "dosageForm",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)))),
                      ),
                      TextField(
                        cursorColor: const Color(0xff0C8A7D),
                        controller: manufacturerController,
                        decoration: const InputDecoration(
                            labelText: "manufacturer",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)))),
                      ),
                      TextField(
                        cursorColor: const Color(0xff0C8A7D),
                        controller: genericnameController,
                        decoration: const InputDecoration(
                            labelText: "genericName",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)))),
                      ),
                      TextField(
                        cursorColor: const Color(0xff0C8A7D),
                        controller: therapeuticController,
                        decoration: const InputDecoration(
                            labelText: "therapeuticClass",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D), fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)))),
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
                    setState(() {
                      Medicines[index] = ListModel(
                          medicationName: medicationnameController.text,
                          dosageForm: dosageformController.text,
                          manufacturer: manufacturerController.text,
                          genericName: genericnameController.text,
                          therapeuticClass: therapeuticController.text,
                          action: 'action');
                    });
                    Navigator.pop(context);
                  })
            ]));
  }

  void addmedicine() {
    // Clear controllers before showing the dialog
    medicationnameController.text = '';
    dosageformController.text = '';
    manufacturerController.text = '';
    genericnameController.text = '';
    therapeuticController.text = '';

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xff0C8A7D),
            content: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: const Icon(Icons.clear),
                          color: const Color(0xffFFFFFF),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Row(children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Medication name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: formstate1,
                            child: TextFormField(
                              controller: medicationnameController,
                              cursorColor: const Color(0xff0C8A7D),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "medication name",
                                  hintStyle: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Dosage form",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: formstate2,
                            child: TextFormField(
                              controller: dosageformController,
                              cursorColor: const Color(0xff0C8A7D),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "dosage form",
                                  hintStyle: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Manufacturer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: formstate3,
                            child: TextFormField(
                              cursorColor: const Color(0xff0C8A7D),
                              controller: manufacturerController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "Manufacturer",
                                  hintStyle: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Generic name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: formstate4,
                            child: TextFormField(
                              cursorColor: const Color(0xff0C8A7D),
                              controller: genericnameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "generic name",
                                  hintStyle: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Therapeutic class",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: formstate5,
                            child: TextFormField(
                              cursorColor: const Color(0xff0C8A7D),
                              controller: therapeuticController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "therapeutic class",
                                  hintStyle: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: 150,
                        child: MaterialButton(
                            color: const Color(0xffFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text("Save",
                                style: TextStyle(
                                    color: Color(0xff0C8A7D),
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            onPressed: () async{
                              if (formstate1.currentState!.validate() &&
                                  formstate2.currentState!.validate() &&
                                  formstate3.currentState!.validate() &&
                                  formstate4.currentState!.validate() &&
                                  formstate5.currentState!.validate()) {
                                await saveprefs();
                                final medicine = ListModel(
                                  medicationName: medicationnameController.text,
                                  dosageForm: dosageformController.text,
                                  manufacturer: manufacturerController.text,
                                  genericName: genericnameController.text,
                                  therapeuticClass: therapeuticController.text,
                                  action: 'action',
                                );
                                setState(() {
                                  Medicines.add(medicine);
                                });
                                Navigator.pop(context);
                              }
                            }),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: 150,
                        child: MaterialButton(
                            color: const Color(0xffFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text("Cancel",
                                style: TextStyle(
                                    color: Color(0xff0C8A7D),
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      )
                    ])
                  ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [

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
                              onPressed: () {}),
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
                              onPressed: () {}),
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
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                        color: const Color(0xFF0E725B),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF0E725B),
                                    size: 35,
                                  ),
                                ),
                                const Text(
                                  "Archive",
                                  style: TextStyle(
                                      fontSize: 40, color: Color(0xFF0E725B)),
                                ),
                              ],
                            ))),
                    const TabBar(
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontSize: 30),
                      indicatorWeight: 2,
                      enableFeedback: true,
                      padding: EdgeInsets.fromLTRB(299, 20, 299, 0),
                      indicatorColor: Color(0xFF0E725B),
                      mouseCursor: WidgetStateMouseCursor.clickable,
                      indicator: BoxDecoration(
                          color: Color(0xFF0E725B), border: Border.symmetric()),
                      tabs: [
                        Tab(
                          text: '        Appointment archive       ',
                        ),
                        Tab(
                          text: '        Medicine archive        ',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            width: 240,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0),
                              const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0)
                            ]),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/img/medical 1.png",
                                ),
                                const Text(
                                  "First",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FollowUp()),
                            );
                          },
                          child: Container(
                            width: 240,
                            height: 200,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0),
                              const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0)
                            ]),
                            child: Column(
                              children: [
                                Image.asset("assets/img/follow 1.png"),
                                const Text(
                                  "Follow up",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Reservation()),
                              );
                            },
                            child: Container(
                              width: 240,
                              height: 200,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: const Offset(4.0, 4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0),
                                const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0)
                              ]),
                              child: Column(
                                children: [
                                  Image.asset("assets/img/reservation 1.png"),
                                  const Text(
                                    "Reservation",
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.black),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          (DateFormat.yMMMMd().format(DateTime.now())),
                          style: const TextStyle(
                              color: Color(0xff0C8A7D), fontSize: 48),
                        ),
                      ),
                    ),
                    EasyDateTimeLine(
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        //`selectedDate` the new date selected.
                      },
                      activeColor: const Color.fromARGB(255, 236, 235, 235),
                      headerProps: const EasyHeaderProps(
                        monthStyle:
                            TextStyle(color: Color(0xff0C8A7D), fontSize: 20),
                        showSelectedDate: false,
                      ),
                      dayProps: const EasyDayProps(
                        todayHighlightStyle: TodayHighlightStyle.withBackground,
                        height: 70,
                        width: 70,
                        dayStructure: DayStructure.dayNumDayStr,
                        inactiveDayStrStyle: TextStyle(color: Colors.white),
                        inactiveBorderRadius: 20,
                        inactiveDayStyle: DayStyle(
                          borderRadius: 44,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(150)),
                            color: Color(0xff0C8A7D),
                            // color:  Color(0xff0C8A7D)
                          ),
                          dayNumStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        activeDayStyle: DayStyle(
                          // decoration: BoxDecoration(border:Border.symmetric()),
                          dayNumStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                          child: const Text(
                        "Sunday",
                        style:
                            TextStyle(color: Color(0xff0C8A7D), fontSize: 45),
                      )),
                    ),
                    Column(children: [
                      const Padding(padding: EdgeInsets.only(left: 40)),
                      TimelineTile(
                        indicatorStyle: const IndicatorStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        isFirst: true,
                        endChild: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 0),
                                child: makeItem(TimeH: 12, TimeM: 26)),
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(20, 10, 1000, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff0C8A7D),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(20.0),
                                  )),
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/stethoscope (4) 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Rahma Anwar"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/user 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Nada Ahmed"),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        indicatorStyle: const IndicatorStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        endChild: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 0),
                                child: makeItem(TimeH: 12, TimeM: 26)),
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(20, 10, 1000, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff0C8A7D),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(20.0),
                                  )),
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/stethoscope (4) 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Manar Fawzy"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/user 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Nada Nasr"),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        indicatorStyle: const IndicatorStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        endChild: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 0),
                                child: makeItem(TimeH: 12, TimeM: 26)),
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(20, 10, 1000, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff0C8A7D),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(20.0),
                                  )),
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/stethoscope (4) 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Manar Fawzy"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/user 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Nada Nasr"),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        indicatorStyle: const IndicatorStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        endChild: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 0),
                                child: makeItem(TimeH: 12, TimeM: 26)),
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(20, 10, 1000, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff0C8A7D),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(20.0),
                                  )),
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/stethoscope (4) 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Manar Fawzy"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Image.asset(
                                      "assets/img/user 1.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Nada Nasr"),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        indicatorStyle: const IndicatorStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff0C8A7D),
                        ),
                        isLast: true,
                      ),
                    ]),
                  ]),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: const Color(0xFF0E725B),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Home()));
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF0E725B),
                                  size: 35,
                                ),
                              ),
                              const Text(
                                "Archive",
                                style: TextStyle(
                                    fontSize: 40, color: Color(0xFF0E725B)),
                              ),
                            ],
                          ))),
                  const TabBar(
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 30),
                    indicatorWeight: 2,
                    enableFeedback: true,
                    padding: EdgeInsets.fromLTRB(299, 20, 299, 0),
                    indicatorColor: Color(0xFF0E725B),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    indicator: BoxDecoration(
                        color: Color(0xFF0E725B), border: Border.symmetric()),
                    tabs: [
                      Tab(
                        text: '        Appointment archive       ',
                      ),
                      Tab(
                        text: '        Medicine archive        ',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: MaterialButton(
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              const Text("Add medicine",
                                  style: TextStyle(
                                      color: Color(0xff0C8A7D),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 2),
                              Image.asset(
                                "assets/img/Add.png",
                                width: 90,
                                height: 90,
                              )
                            ]),
                            onPressed: () {
                              addmedicine();
                              
                            })),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff72CEBF),
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Text(attributes.medicationName,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 40),
                        Text(attributes.dosageForm,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 40),
                        Text(attributes.manufacturer,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 40),
                        Text(attributes.genericName,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 50),
                        Text(attributes.therapeuticClass,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 50),
                        Text(attributes.action,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 20),
                      ]),
                    ),
                  ),
                  const Divider(),
                  ...Medicines.map(
                    (item) => Card(
                      color: const Color(0xffFFFFFF),
                      child: Expanded(
                        child: Container(
                          color: const Color(0xffFFFFFF),
                          child: Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                const SizedBox(width: 25),
                                Text(item.medicationName,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 30),
                                Text(item.dosageForm,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 30),
                                Text(item.manufacturer,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal)),
                                const SizedBox(width: 30),
                                Text(item.genericName,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal)),
                                const SizedBox(width: 30),
                                Text(item.therapeuticClass,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal)),
                                const SizedBox(width: 30),
                                Container(
                                  child: Row(children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        iconSize: 40,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          editMedicine(index);
                                        }),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 40,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          setState(() {
                                            Medicines.removeAt(
                                                Medicines.indexOf(item));
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
                ],
              ),
            ),
          ]),
        ));
  }

  Widget makeItem({TimeH, TimeM}) {
    return Row(
      children: [
        Text(
          TimeH.toString(),
          style: const TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 73, 74, 74)),
        ),
        const Text(
          ":",
          style: TextStyle(fontSize: 25),
        ),
        Text(
          TimeM.toString(),
          style: const TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 73, 74, 74)),
        )
      ],
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
      {required this.medicationName,
      required this.dosageForm,
      required this.manufacturer,
      required this.genericName,
      required this.therapeuticClass,
      required this.action});

  String medicationName,
      dosageForm,
      manufacturer,
      genericName,
      therapeuticClass,
      action;
}
