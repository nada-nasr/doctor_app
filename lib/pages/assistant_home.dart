import 'dart:js';
import 'dart:ui';
import 'package:doctor_app/pages/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AssistantHome extends StatelessWidget {
  const AssistantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 3,
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
                      // setState(() {
                      //   const Icon(Icons.notifications);
                      // });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const Notifications()));
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
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => const Profile()));
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
                                  // Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const Login()));
                                }),
                          ),
                        ]),
              ],
              backgroundColor: const Color(0xffFFFFFF),
              iconTheme: const IconThemeData(
                size: 45,
                color: Color(0xFF0E725B),
              ),
              bottom: TabBar(
                  indicatorPadding:
                      const EdgeInsets.only(left: -30, right: -30),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicator: BoxDecoration(
                      color: const Color(0xff0C8A7D),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  labelColor: const Color(0xffFFFFFF),
                  unselectedLabelColor: const Color(0xff333333),
                  overlayColor:
                      const MaterialStatePropertyAll(Color(0xffFFFFFF)),
                  splashBorderRadius: BorderRadius.circular(5),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  tabs: const [
                    Tab(
                        child: Row(children: [
                      SizedBox(width: 80),
                      Text(
                        "Todays queue",
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(width: 80),
                    ])),
                    Tab(
                        child: Row(children: [
                      SizedBox(width: 80),
                      Text(
                        "Add reservation",
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(width: 80),
                    ])),
                    Tab(
                        child: Row(children: [
                      SizedBox(width: 80),
                      Text(
                        "Add follow up ",
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(width: 80),
                    ])),
                  ]),
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
            body: Expanded(
                child: TabBarView(children: [
              ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    margin: const EdgeInsets.all(30),
                    child: Wrap(
                      runSpacing: 30,
                      spacing: 70,
                      children: [
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                        queueButton(context),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(50),
                  child: Expanded(
                      child: ListView(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
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
                                    hoverColor: const Color.fromARGB(
                                        186, 179, 213, 209),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SharedColorTextblack(
                                            fontWeight: FontWeight.normal,
                                            text: " Add Patient",
                                            fontSize: 20),
                                        Image.asset("images/Add.png")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        CustomDropdownButton2(
                                            hint: "Patient", items: patient),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: const SharedColorTextCADBold(
                                              text: "Patient"),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        CustomDropdownButton2(
                                            hint: "Doctor", items: doctor),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: const SharedColorTextCADBold(
                                              text: "Doctor"),
                                        )
                                      ],
                                    ),
                                    time(),
                                    SingleChildScrollView(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            margin: const EdgeInsets.only(
                                                right: 20, left: 30),
                                            child: save(),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            child: cancel(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                    ],
                  ))),
              Container(
                  margin: const EdgeInsets.all(50),
                  child: Expanded(
                      child: ListView(
                    children: [
                      Column(children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: [
                                    CustomDropdownButton2(
                                        hint: "Patient", items: patient),
                                    Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: const SharedColorTextCADBold(
                                          text: "Patient"),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    CustomDropdownButton2(
                                        hint: "Doctor", items: doctor),
                                    Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: const SharedColorTextCADBold(
                                          text: "Doctor"),
                                    )
                                  ],
                                ),
                                time(),
                                SingleChildScrollView(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        margin: const EdgeInsets.only(
                                            right: 20, left: 30),
                                        child: save(),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        margin: const EdgeInsets.only(left: 20),
                                        child: cancel(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ]),
                    ],
                  )))
            ]))));
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
// .........colorstext

// today queue
Widget queueButton(BuildContext context) {
  return Container(
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
    child: MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewDetail()));
      },
      child: Container(
        width: 385,
        height: 360,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: Row(children: [
                Column(children: [
                  Image.asset(
                    "images/Group.png",
                    height: 125,
                    width: 125,
                  )
                ]),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SharedColorTextBlackBold(text: "Dr.Ahmed Ali"),
                      const SharedColorTextblack(
                        fontWeight: FontWeight.w100,
                        text: "consulation",
                        fontSize: 26,
                        color: Color.fromARGB(155, 0, 0, 0),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.2, color: Colors.black87),
                                color: const Color(0xFF0E725B),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("images/Done.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.2, color: Colors.black87),
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("images/X.png"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
            const Divider(
              color: Color(0XFFDDDCDC),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: const SharedColorTextblack(
                    fontWeight: FontWeight.normal,
                    text: "11:00 AM - 5:30 PM",
                    fontSize: 30)),
            const Divider(
              color: Color(0XFFDDDCDC),
            ),
            const SharedColorTextCADnormal(text: "view details", fontSize: 30)
          ],
        ),
      )
    ),
  );
}

Widget save() {
  return Container(
      height: 50,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xff096B61),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: const Text('Save',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ));
}

Widget cancel() {
  return Container(
      height: 50,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xff096B61),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState != null) {
            _formKey.currentState!.reset();
          }
        },
        child: const Text('Cancel',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ));
}

Widget time() {
  return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Enter Time',
        ),
        textAlign: TextAlign.start,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Time should not be empty';
          }
          return null;
        },
      ));
}

// doctor list
final List<String> doctor = [
  'doctor1',
  'doctor2',
  'doctor3',
  'doctor4',
  'doctor5',
  'doctor6',
  'doctor7',
  'doctor8',
];

// patient list
final List<String> patient = [
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
String? selectedValue;

final _formKey = GlobalKey<FormState>();

void setState(Null Function() param0) {}

// dropdown list
class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final List items;
  const CustomDropdownButton2({
    required this.hint,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: DropdownButtonFormField2<String>(
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 8,
          offset: const Offset(0, 0),
          isOverButton: false,
          scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(40),
          ),
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: SearchController(),
        ),
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        hint: Text(hint),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },

        validator: (value) {
          if (value == null) {
            return 'Please choose one.';
          }
          return null;
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Color(0xff096B61),
          ),
          iconSize: 35,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

TextEditingController timeController = TextEditingController();

DateTime _dateTime = DateTime.now();
void showTimePicker(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            backgroundColor: const Color(0xffF1F6FC),
            content: SizedBox(
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 400,
                      child: CupertinoDatePicker(
                          initialDateTime: _dateTime,
                          mode: CupertinoDatePickerMode.time,
                          use24hFormat: false,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          }),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.clear),
                          iconSize: 27,
                          color: const Color(0xff0C8A7D),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.done),
                          iconSize: 27,
                          color: const Color(0xff0C8A7D),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      );
    },
  );
}

