import 'package:doctor_app/pages/assistants.dart';
import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/Patients.dart';
import 'package:doctor_app/pages/Scans.dart';
import 'package:doctor_app/pages/doctors.dart';
import 'package:doctor_app/pages/first.dart';
import 'package:doctor_app/pages/lab_tests.dart';
import 'package:doctor_app/pages/login.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:doctor_app/pages/notification.dart';
import 'package:doctor_app/pages/reports.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
/*List total = [
  info(
      title: "Doctors",
      num: 5,
      img: Image.asset("assets/img/medical-team.png"),
      color: Colors.white),
  info(
      title: "Patients",
      num: 43,
      img: Image.asset("assets/img/patient.png"),
      color: Colors.white),
  info(
      title: "Assistants",
      num: 4,
      img: Image.asset("assets/img/information.png"),
      color: Colors.white),
  info(
      title: "Lab Tests",
      num: 15,
      img: Image.asset("assets/img/microscope.png"),
      color: Colors.white),
  info(
      title: "Reports",
      num: 7,
      img: Image.asset("assets/img/check-up.png"),
      color: Colors.white),
  info(
      title: "Scan",
      num: 9,
      img: Image.asset("assets/img/body.png"),
      color: Colors.white)
];
*/
  Map<String, double> dataMap = {
    "Normal": 10,
    "Cyst": 30,
    "Stone": 20,
    "Tumor": 40,
  };
  late List<Bar_data> data;
  @override
  void initState() {
    data = [
      Bar_data('Sun', 2000, 1000),
      Bar_data(
        'Mon',
        4000,
        2000,
      ),
      Bar_data(
        'Tue',
        5000,
        4000,
      ),
      Bar_data(
        'Wed',
        1000,
        5000,
      ),
      Bar_data(
        'Thurs',
        1000,
        5000,
      ),
      Bar_data(
        'Fri',
        1000,
        5000,
      ),
      Bar_data('Sat', 1000, 5000),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1306.4) {
        return Scaffold(
          appBar: AppBar(
            elevation: 2,
            automaticallyImplyLeading: false,
            actions: [
              /*IconButton(
                onPressed: () {
                  return;
                },
                icon: const Icon(
                  Icons.language,
                  size: 44,
                  color: Color(0xff0C8A7D),
                ),
              ),*/
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
          ),
          body: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Drawer(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: const Color(0xff0C8A7D),
                    child: 
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: const Icon(Icons.menu),
                                iconSize: 60,
                                color: const Color(0xffFFFFFF),
                                onPressed: () {}),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const First()));
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
                ),
                const SizedBox(
                  width: 60,
                ),
                //Center(child: Text("$screenWidth, $screenHeight")),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      // charts
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                child: 
                                SfCartesianChart(
                                    legend: const Legend(
                                        overflowMode:
                                            LegendItemOverflowMode.wrap),
                                    primaryXAxis: const CategoryAxis(),
                                    primaryYAxis: const NumericAxis(),
                                    // tooltipBehavior: _tooltip,
                                    series: <CartesianSeries<Bar_data, String>>[
                                  ColumnSeries<Bar_data, String>(
                                    dataSource: data,
                                    xValueMapper: (Bar_data data, _) => data.x,
                                    yValueMapper: (Bar_data data, _) => data.y1,
                                    color: const Color(0xff0C8A7D),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                  ColumnSeries<Bar_data, String>(
                                    dataSource: data,
                                    xValueMapper: (Bar_data data, _) => data.x,
                                    yValueMapper: (Bar_data data, _) => data.y2,
                                    color:
                                        const Color.fromRGBO(248, 187, 208, 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                ])),
                            Container(
                              child: Center(
                                child: PieChart(
                                  dataMap: dataMap,
                                  colorList: const [
                                    Color.fromARGB(255, 138, 196, 244),
                                    Color.fromRGBO(248, 187, 208, 1),
                                    Color.fromARGB(248, 182, 186, 186),
                                    Color(0xff0C8A7D)
                                  ],
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 6.0,
                                  chartType: ChartType.disc,
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Doctors()));
                                              },
                                              child:   Column(children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text("5  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    Image.asset(
                                                      "assets/img/medical-team.png",
                                                      width: 90,
                                                      height: 90,
                                                    ),
                                                  ]),const Text("Doctors",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            
                                            ]),),)
                                          
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Patients()));
                                              },
                                              child:   Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "43  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      Image.asset(
                                                        "assets/img/patient.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),const Text(
                                                    "Patients",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  )
                                              ]
                                            )))
                                          
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Assistants()));
                                              },
                                              child:   Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "4  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      Image.asset(
                                                        "assets/img/information.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),const Text(
                                                    "Assistants",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              ],
                                            ),),)
                                          
                                          ),
                                        ]),
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(5),
                                          width: 250,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff0C8A7D),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const LabTests()));
                                              },
                                              child:Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [const Text(
                                                        "15  ",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 44),
                                                      ),
                                                    Image.asset(
                                                      "assets/img/microscope.png",
                                                      width: 90,
                                                      height: 90,
                                                    ),
                                                  ]),
                                              const Text(
                                                  "Lab Tests",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 44),
                                                ),
                                            ],
                                          ),),)
                                          
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(5),
                                          width: 250,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff0C8A7D),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child:
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const Reports()));
                                              },
                                              child:  Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text(
                                                        "7  ",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 44),
                                                      ),
                                                    Image.asset(
                                                      "assets/img/check-up.png",
                                                      width: 90,
                                                      height: 90,
                                                    ),
                                                  ]),
                                              const Text(
                                                  "Reports",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 44),
                                                ),
                                            ],
                                          ),),) 
                                        
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(5),
                                          width: 250,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff0C8A7D),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child:
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => const Scans()));
                                              },
                                              child:   Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                   const Text(
                                                        "9  ",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 44),
                                                      ),
                                                    Image.asset(
                                                      "assets/img/body.png",
                                                      width: 90,
                                                      height: 90,
                                                    ),
                                                  ]), const Text(
                                                  "Scan",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 44),
                                                ),
                                            ],
                                          ),),) 
                                        
                                        ),
                                      ]),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
        ////////////////////////////////////////////////////////////////////////////////////////////////
      } else {
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
          body: SafeArea(
            child: Row(
              children: [
                //Center(child: Text("$screenWidth, $screenHeight")),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      // charts
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                child: SfCartesianChart(
                                    legend: const Legend(
                                        overflowMode:
                                            LegendItemOverflowMode.wrap),
                                    primaryXAxis: const CategoryAxis(),
                                    primaryYAxis: const NumericAxis(),
                                    // tooltipBehavior: _tooltip,
                                    series: <CartesianSeries<Bar_data, String>>[
                                  ColumnSeries<Bar_data, String>(
                                    dataSource: data,
                                    xValueMapper: (Bar_data data, _) => data.x,
                                    yValueMapper: (Bar_data data, _) => data.y1,
                                    color: const Color(0xff0C8A7D),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                  ColumnSeries<Bar_data, String>(
                                    dataSource: data,
                                    xValueMapper: (Bar_data data, _) => data.x,
                                    yValueMapper: (Bar_data data, _) => data.y2,
                                    color:
                                        const Color.fromRGBO(248, 187, 208, 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                ])),
                            Container(
                              child: Center(
                                child: PieChart(
                                  dataMap: dataMap,
                                  colorList: const [
                                    Color.fromARGB(255, 138, 196, 244),
                                    Color.fromRGBO(248, 187, 208, 1),
                                    Color.fromARGB(248, 182, 186, 186),
                                    Color(0xff0C8A7D)
                                  ],
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 6.0,
                                  chartType: ChartType.disc,
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child:
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Doctors()));
                                              },
                                              child:   Column(children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Text("5  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  
                                                    Image.asset(
                                                      "assets/img/medical-team.png",
                                                      width: 90,
                                                      height: 90,
                                                    ),
                                                  ]),
                                            const Text("Doctors",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            ])),) 
                                          
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child:
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Patients()));
                                              },child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "43  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      Image.asset(
                                                        "assets/img/patient.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),const Text(
                                                    "Patients",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              
                                              ],
                                            ),),) 
                                            
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                  Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Assistants()));
                                              },child:  Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "4  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      
                                                      Image.asset(
                                                        "assets/img/information.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),
                                                const Text(
                                                    "Assistants",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              
                                              ],
                                            ),),)
                                          
                                          ),
                                        ]),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: 
                                              MaterialButton(onPressed: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const LabTests()));
                                              },child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "15  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                    
                                                      Image.asset(
                                                        "assets/img/microscope.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),
                                                const Text(
                                                    "Lab Tests",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              
                                              ],
                                            ),),)
                                            
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                                child: 
                                                MaterialButton(
                                                  onPressed: (){
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => const Reports()));
                                                },
                                                child:   Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                         const Text(
                                                          "7  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      // ),
                                                      Image.asset(
                                                        "assets/img/check-up.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]), const Text(
                                                    "Reports",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              
                                              ],
                                            ),)
                                          
                                          )),
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            width: 250,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0C8A7D),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: 
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: MaterialButton(onPressed: (){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => const Scans()));

                                              },child:   Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Text(
                                                          "9  ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 44),
                                                        ),
                                                      
                                                      Image.asset(
                                                        "assets/img/body.png",
                                                        width: 90,
                                                        height: 90,
                                                      ),
                                                    ]),
                                                const Text(
                                                    "Scan",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 44),
                                                  ),
                                              
                                              ],
                                            ),),)
                                          
                                          ),
                                        ]),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }
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

class Bar_data {
  Bar_data(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}



