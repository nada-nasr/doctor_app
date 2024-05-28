// ignore_for_file: unnecessary_import, unused_import, unused_element, camel_case_types, unused_field, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, non_constant_identifier_names, duplicate_ignore, must_be_immutable, avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/pages/follow.dart';
import 'package:doctor_app/pages/generate_report.dart';
import 'package:doctor_app/pages/prescription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final _scrollController = ScrollController();

class patient_profile extends StatefulWidget {
  const patient_profile({super.key});

  @override
  State<patient_profile> createState() => _HistState();
}

String groupValue = "Normal";
  String groupValue1 = "Normal";
  String groupValue3 = "good";
  String groupValue4 = "Present";
  String groupValue5 = "Yes";
  String groupValue6 = "Yes";
  String groupValue7 = "Yes";
  String groupValue8 = "Yes";
  String groupValue9 = "Yes";

  String groupValue10 = "Present";

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
  GlobalKey<FormState> formstate6 = GlobalKey();
  GlobalKey<FormState> formstate7 = GlobalKey();
  GlobalKey<FormState> formstate8 = GlobalKey();
  GlobalKey<FormState> formstate9 = GlobalKey();
  GlobalKey<FormState> formstate10 = GlobalKey();
  GlobalKey<FormState> formstate11 = GlobalKey();
  GlobalKey<FormState> formstate12 = GlobalKey();

  final attributes = ListModel(
      PEMO: 'PEMO',
      PCV: 'PCV',
      WBC: 'WBC',
      BP: 'BP',
      BGR: 'BGR',
      BU: 'BU',
      SC: 'SC',
      SOD: 'SOD',
      SG: 'SG',
      AL: 'AL',
      SU: 'SU',
      POT: 'POT',
      RBC: 'RBC',
      PC: 'PC',
      PCC: 'PCC',
      BA: 'BA',
      HTN: 'HTN',
      DM: 'DM',
      CAD: 'CAD',
      PE: "PE",
      ANE: "ANE",
      APPET: 'APPET');

      class ListModel {
  ListModel({
    required this.PEMO,
    required this.PCV,
    required this.WBC,
    required this.BP,
    required this.BGR,
    required this.BU,
    required this.SC,
    required this.SOD,
    required this.SU,
    required this.SG,
    required this.AL,
    required this.POT,
    required this.ANE,
    required this.APPET,
    required this.BA,
    required this.CAD,
    required this.DM,
    required this.HTN,
    required this.PC,
    required this.PCC,
    required this.PE,
    required this.RBC,
  });

  String PEMO,
      PCV,
      WBC,
      BP,
      BGR,
      BU,
      SC,
      SOD,
      SG,
      AL,
      SU,
      POT,
      RBC,
      PC,
      PCC,
      BA,
      HTN,
      DM,
      CAD,
      PE,
      ANE,
      APPET;
}


class _HistState extends State<patient_profile> {
  late List<_ChartData> data;
  TooltipBehavior? _tooltipBehavior;
  List<ChartData>? chartData;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Sun', 1000),
      _ChartData('Mon', 2000),
      _ChartData('Tue', 1800),
      _ChartData('Wed', 1900),
      _ChartData('Thurs', 1500),
      _ChartData('Fri', 1700),
      _ChartData('Sat', 2000),
    ];

    super.initState();
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image has been picked");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print("No image has been picked");
      }
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Chartdata> chartData = <Chartdata>[
      Chartdata('Sun', 220, 100),
      Chartdata('Mon', 120, 120),
      Chartdata('Tue', 140, 90),
      Chartdata('Wed', 100, 60),
      Chartdata('Thurs', 150, 70),
      Chartdata('Fri', 140, 100),
      Chartdata('Sat', 170, 110),
    ];

    final List<Color> color = <Color>[];
    color.add(Colors.pink[50]!);
    color.add(Colors.pink[100]!);
    color.add(Colors.pink[200]!);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 246, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F6FC),
        title: const Text(
          "profile",
          style: TextStyle(
              color: Color(0xff0C8A7D),
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            child: buildGenerateReportButton(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // name & id
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: Material(
                            elevation: 3,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shadowColor: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.only(top: 15),
                              height: 220,
                              width: 300,
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/Group.png",
                                      width: 110,
                                      height: 110,
                                    ),
                                    const SharedColorTextCADBold(
                                        text: "Olivia Connor", fontSize: 30),
                                    const SharedColorTextCADnormal(
                                        text: "ID 1234556", fontSize: 20)
                                  ],
                                ),
                              ),
                            )),
                      ),
                      // Patient Details
                      Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: Material(
                              elevation: 3,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              shadowColor: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                height: 225,
                                width: 300,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SharedColorTextCADBold(
                                          text: " Patient Details",
                                          fontSize: 24),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5, bottom: 10),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SharedColorTextCADnormal(
                                                    text: "Gender",
                                                    fontSize: 18),
                                                SharedColorTextCADnormal(
                                                    text: "D.O.B",
                                                    fontSize: 18),
                                                SharedColorTextCADnormal(
                                                    text: "Age", fontSize: 18),
                                                SharedColorTextCADnormal(
                                                    text: "Blood Group",
                                                    fontSize: 18),
                                                SharedColorTextCADnormal(
                                                    text: "Height",
                                                    fontSize: 18),
                                                SharedColorTextCADnormal(
                                                    text: "Weight",
                                                    fontSize: 18),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 80, top: 5, bottom: 10),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SharedColorTextblack(
                                                    text: "Female",
                                                    fontSize: 18),
                                                SharedColorTextblack(
                                                    text: "1/5/1987",
                                                    fontSize: 18),
                                                SharedColorTextblack(
                                                    text: "37", fontSize: 18),
                                                SharedColorTextblack(
                                                    text: "A+", fontSize: 18),
                                                SharedColorTextblack(
                                                    text: "167", fontSize: 18),
                                                SharedColorTextblack(
                                                    text: "78", fontSize: 18),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ))),
                      // Contact information
                      Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15),
                          child: Material(
                              elevation: 3,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              shadowColor: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 5, bottom: 4),
                                height: 180,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SharedColorTextCADBold(
                                        text: "Contact information ",
                                        fontSize: 20),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "images/Phone.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const SharedColorTextCADnormal(
                                            text: "Phone Contact ",
                                            fontSize: 16)
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 30, bottom: 5),
                                      child: const SharedColorTextblack(
                                          text: "+2011184521", fontSize: 14),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      child: const SharedColorTextblack(
                                          text: "+2011184521", fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "images/Email.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const SharedColorTextCADnormal(
                                            text: "E-mail ", fontSize: 16)
                                      ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 30),
                                        child: const SharedColorTextblack(
                                            text: "fghybhghx85@gmail.com",
                                            fontSize: 14)),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    // height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // heart rate &blood pressure & diabetes
                          Row(
                            children: [
                              Container(
                                  height: 200,
                                  width: 360,
                                  padding: const EdgeInsets.only(top: 15),
                                  margin: const EdgeInsets.only(
                                      right: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            "images/Heart with Pulse.png"),
                                        const SharedColorTextCADBold(
                                            text: "Heart Rate", fontSize: 32),
                                        const SharedColorTextblack(
                                            text: "66", fontSize: 26),
                                        const SharedColorTextblack(
                                            text:
                                                "Last Recorded on 9 Mar at 7:64 pm ",
                                            fontSize: 18)
                                      ],
                                    ),
                                  )),
                              Container(
                                  height: 200,
                                  width: 360,
                                  padding: const EdgeInsets.only(top: 15),
                                  margin: const EdgeInsets.only(
                                      right: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/Tonometer.png",
                                          height: 55,
                                          width: 60,
                                        ),
                                        const SharedColorTextCADBold(
                                            text: "Blood Pressure",
                                            fontSize: 32),
                                        const SharedColorTextblack(
                                            text: "118 / 54", fontSize: 26),
                                        const SharedColorTextblack(
                                            text:
                                                "Last Recorded on 9 Mar at 7:64 pm ",
                                            fontSize: 18)
                                      ],
                                    ),
                                  )),
                              Container(
                                  height: 200,
                                  width: 360,
                                  padding: const EdgeInsets.only(top: 15),
                                  margin: const EdgeInsets.only(
                                      right: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset("images/Glucometer.png"),
                                        const SharedColorTextCADBold(
                                            text: "Diabetes", fontSize: 32),
                                        const SharedColorTextblack(
                                            text: "175", fontSize: 26),
                                        const SharedColorTextblack(
                                            text:
                                                "Last Recorded on 9 Mar at 7:64 pm ",
                                            fontSize: 18)
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          // note & activites
                          Row(
                            children: [
                              // note
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 5, bottom: 10),
                                child: Material(
                                    elevation: 3,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shadowColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      height: 265,
                                      width: 550,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const SharedColorTextCADBold(
                                                  text: "Notes", fontSize: 34),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 295),
                                                child:
                                                    const SharedColorTextblack(
                                                  text: "25 Feb 2024",
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "images/Back To.png",
                                                    width: 80,
                                                    height: 80,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      height: 150,
                                                      width: 395,
                                                      child:
                                                          const MyCustomForm()),
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 325,
                                                              top: 10),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                          child: MaterialButton(
                                                              onPressed: () {},
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      "images/plus.png"),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  const SharedColorTextblack(
                                                                    text: "Add",
                                                                    fontSize:
                                                                        22,
                                                                  )
                                                                ],
                                                              ))))
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              // activites
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15, right: 10, bottom: 10),
                                child: Material(
                                    elevation: 3,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shadowColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 20),
                                      height: 265,
                                      width: 550,
                                      child: Column(
                                        children: [
                                          const Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SharedColorTextCADBold(
                                                  text: "Activites",
                                                  fontSize: 34),
                                            ],
                                          ),
                                          SizedBox(
                                              width: 350,
                                              height: 200,
                                              child: SfCircularChart(
                                                  key: GlobalKey(),
                                                  legend: const Legend(
                                                      toggleSeriesVisibility:
                                                          false,
                                                      isVisible: true,
                                                      iconHeight: 20,
                                                      iconWidth: 20,
                                                      overflowMode:
                                                          LegendItemOverflowMode
                                                              .wrap),
                                                  series: <CircularSeries<
                                                      ChartData, String>>[
                                                    RadialBarSeries<ChartData,
                                                        String>(
                                                      maximumValue: 1000,
                                                      radius: '100%',
                                                      gap: '3%',
                                                      dataSource: [
                                                        ChartData(
                                                            'ML ',
                                                            800,
                                                            const Color
                                                                .fromARGB(255,
                                                                158, 202, 237),
                                                            'ML'),
                                                        ChartData(
                                                            'Mins ',
                                                            7200,
                                                            const Color
                                                                .fromARGB(219,
                                                                255, 138, 194),
                                                            'Mins'),
                                                        ChartData(
                                                            'Steps ',
                                                            10500,
                                                            const Color
                                                                .fromARGB(217,
                                                                72, 203, 140),
                                                            'Steps'),
                                                      ],
                                                      cornerStyle:
                                                          CornerStyle.bothCurve,
                                                      xValueMapper:
                                                          (ChartData data, _) =>
                                                              data.x,
                                                      yValueMapper:
                                                          (ChartData data, _) =>
                                                              data.y,
                                                      pointColorMapper:
                                                          (ChartData data, _) =>
                                                              data.Color,
                                                      dataLabelMapper:
                                                          (ChartData data, _) =>
                                                              data.text,
                                                      dataLabelSettings:
                                                          const DataLabelSettings(
                                                              isVisible: true),
                                                    )
                                                  ]))
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                          // lab test & medicine &follow up & Prescription
                          Row(
                            children: [
                              // lab test
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  // margin: const EdgeInsets.all(8),
                                  color: Colors.white,
                                  height: 350,
                                  width: 430,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return ListView(
                                                    children: [
                                                      AlertDialog(
                                                          title: Container(
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Image.asset(
                                                                      "images/Group.png",
                                                                      width:
                                                                          110,
                                                                      height:
                                                                          110,
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          20),
                                                                  child:
                                                                      const Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SharedColorTextCADBold(
                                                                          text:
                                                                              "Olivia Connor",
                                                                          fontSize:
                                                                              30),
                                                                      SharedColorTextblack(
                                                                          text:
                                                                              "15 feb 1965",
                                                                          fontSize:
                                                                              24)
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 110,
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              450),
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child: IconButton(
                                                                      onPressed: () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      icon: const Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Color(
                                                                            0xff0C8A7D),
                                                                        size:
                                                                            35,
                                                                      )),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          content:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            margin: const EdgeInsets.only(
                                                                                left: 30,
                                                                                right: 30,
                                                                                bottom: 5,
                                                                                top: 5),
                                                                            width:
                                                                                350,
                                                                            height:
                                                                                70,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
                                                                              BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))
                                                                            ]),
                                                                            child:
                                                                                const SharedColorTextCADBold(text: "Lab Tests", fontSize: 30),
                                                                          ),
                                                                          Stack(
                                                                            alignment:
                                                                                Alignment.bottomRight,
                                                                            children: [
                                                                              SizedBox(
                                                                                  height: 500,
                                                                                  width: 300,
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.vertical,
                                                                                    child: Container(
                                                                                        // height: 400,
                                                                                        child: Column(
                                                                                      children: [
                                                                                        testdatail(),
                                                                                        testdatail(),
                                                                                        testdatail(),
                                                                                      ],
                                                                                    )),
                                                                                  )),
                                                                                  AddTest()
                                                                              // Assuming this IconButton is within a valid parent widget
                                                                              // Container(
                                                                              //   child: IconButton(
                                                                              //     color: const Color(0xff0C8A7D),
                                                                              //     onPressed: () {
                                                                              //       // Navigate to add test page
                                                                              //       // Navigator.of(context).push(
                                                                              //       // MaterialPageRoute(builder: (context) => const AddTest()),
                                                                              //       // );
                                                                              //       _AddTestState();
                                                                              //     },
                                                                              //     icon: const Icon(Icons.add_circle),
                                                                              //     iconSize: 80,
                                                                              //   ),
                                                                              // )
                                                                            ],
                                                                          )
                                                                        ]),
                                                                  ),
                                                                  Column(
                                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .only(
                                                                              left: 30,
                                                                              right: 30,
                                                                              bottom: 5,
                                                                              top: 5),
                                                                          width:
                                                                              350,
                                                                          height:
                                                                              70,
                                                                          alignment:
                                                                              Alignment.center,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: Colors.white,
                                                                              boxShadow: [
                                                                                BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))
                                                                              ]),
                                                                          child: const SharedColorTextCADBold(
                                                                              text: "Scan",
                                                                              fontSize: 30),
                                                                        ),
                                                                        Stack(
                                                                          alignment:
                                                                              Alignment.bottomRight,
                                                                          children: [
                                                                            SizedBox(
                                                                                height: 500,
                                                                                width: 300,
                                                                                child: SingleChildScrollView(
                                                                                  scrollDirection: Axis.vertical,
                                                                                  child: Container(
                                                                                      // height: 400,
                                                                                      child: Column(
                                                                                    children: [
                                                                                      ScanDatial(context),
                                                                                      ScanDatial(context),
                                                                                      ScanDatial(context),
                                                                                      ScanDatial(context),
                                                                                      ScanDatial(context),
                                                                                      ScanDatial(context),
                                                                                    ],
                                                                                  )),
                                                                                )),
                                                                            IconButton(
                                                                              color: const Color(0xff0C8A7D),
                                                                              // color: Color.fromARGB(255, 254, 255, 255),

                                                                              onPressed: () {
                                                                                showDialog(
                                                                                    barrierDismissible: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return ListView(
                                                                                        children: [
                                                                                          AlertDialog(
                                                                                              title: Container(
                                                                                                alignment: Alignment.centerRight,
                                                                                                child: IconButton(
                                                                                                    onPressed: () {
                                                                                                      Navigator.of(context).pop();
                                                                                                    },
                                                                                                    icon: const Icon(Icons.close_rounded)),
                                                                                              ),
                                                                                              content: Container(
                                                                                                // height: 300,
                                                                                                child: SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                    child: Column(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                            margin: const EdgeInsets.all(10),
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 200,
                                                                                                                  height: 60,
                                                                                                                  margin: const EdgeInsets.only(right: 8),
                                                                                                                  alignment: Alignment.center,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  child: const SharedColorTextCADnormal(text: "Patient name", fontSize: 26),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 300,
                                                                                                                  height: 60,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  // child: Text("data"),
                                                                                                                )
                                                                                                              ],
                                                                                                            )),
                                                                                                        Container(
                                                                                                            margin: const EdgeInsets.all(10),
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 200,
                                                                                                                  height: 60,
                                                                                                                  margin: const EdgeInsets.only(right: 8),
                                                                                                                  alignment: Alignment.center,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  child: const SharedColorTextCADnormal(text: "Doctor name", fontSize: 26),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 300,
                                                                                                                  height: 60,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  // child: Text("data"),
                                                                                                                )
                                                                                                              ],
                                                                                                            )),
                                                                                                        Container(
                                                                                                            margin: const EdgeInsets.all(10),
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 200,
                                                                                                                  height: 60,
                                                                                                                  margin: const EdgeInsets.only(right: 8),
                                                                                                                  alignment: Alignment.center,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  child: const SharedColorTextCADnormal(text: "Assistant name", fontSize: 26),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 300,
                                                                                                                  height: 60,
                                                                                                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                                                  // child: Text("data"),
                                                                                                                )
                                                                                                              ],
                                                                                                            )),
                                                                                                        Container(
                                                                                                          height: 280,
                                                                                                          width: 550,
                                                                                                          margin: const EdgeInsets.only(bottom: 5),
                                                                                                          child: MaterialButton(
                                                                                                            padding: const EdgeInsets.all(50),
                                                                                                            onPressed: () {
                                                                                                              // upload image from pc
                                                                                                              _pickImage();
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              child: _pickedImage == null
                                                                                                                  ? Column(
                                                                                                                      children: [
                                                                                                                        Image.asset("images/upload (2) 1.png"),
                                                                                                                        const Text("upload image", style: TextStyle(color: Color(0xff8B8989), fontWeight: FontWeight.bold, fontSize: 30)),
                                                                                                                        const Text(
                                                                                                                          "choose file",
                                                                                                                          style: TextStyle(color: Color(0xff8B8989), fontWeight: FontWeight.w500, fontSize: 26),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    )
                                                                                                                  : kIsWeb
                                                                                                                      ? Image.memory(
                                                                                                                          webImage,
                                                                                                                          fit: BoxFit.fill,
                                                                                                                        )
                                                                                                                      : Image.file(
                                                                                                                          _pickedImage!,
                                                                                                                          fit: BoxFit.fill,
                                                                                                                        ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        MaterialButton(
                                                                                                          color: const Color(0xff0C8A7D),
                                                                                                          textColor: Colors.white,
                                                                                                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                                                                                          onPressed: () {},
                                                                                                          child: const Text(
                                                                                                            "Save",
                                                                                                            style: TextStyle(fontSize: 26),
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                    )),
                                                                                              ))
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              icon: const Icon(Icons.add_circle),
                                                                              iconSize: 80,
                                                                            )
                                                                          ],
                                                                        )
                                                                      ])
                                                                ],
                                                              ),
                                                            ),
                                                          ))
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const SharedColorTextCADBold(
                                              text: "Lab", fontSize: 36)),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        margin: const EdgeInsets.only(top: 10),
                                        height: 110,
                                        width: 420,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    const Color(0xff0C8A7D))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SharedColorTextCADnormal(
                                                text: "Lab Test", fontSize: 26),
                                            Row(
                                              children: [
                                                TestContainer(),
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: MaterialButton(
                                                        height: 40,
                                                        minWidth:
                                                            double.infinity,
                                                        onPressed: () {
                                                          // add test
                                                          // Navigator.of(context).push(
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 const AddTest()
                                                          //                 ));
                                                              showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    backgroundColor: const Color(0xffFFFFFF),
                    content: Expanded(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                child: Column(children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    icon: const Icon(Icons.clear),
                                    color: const Color(0xff0C8A7D),
                                    iconSize: 30,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: 
                                Column(
                                  children: [
                                     Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                            width: 620,
                            height: 80,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(left: 60, top: 20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 91, 189, 179),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Field",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 240,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            
                          ),
                       
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    
                    child: const Text("RBC",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child:
                    Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue,
                      onChanged: (value13) {
                        setState(() {
                          groupValue = value13!;
                        });
                      }),
                  const Text(
                    "Normal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue,
                      onChanged: (value13) {
                        setState(() {
                          groupValue = value13!;
                        });
                      }),
                  const Text(
                    "Ubnormal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
        
                      
                    ),
                    child: const Text("PC",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue1,
                      onChanged: (value14) {
                        setState(() {
                          groupValue1 = value14!;
                        });
                      }),
                  const Text(
                    "Normal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue1,
                      onChanged: (value14) {
                        setState(() {
                          groupValue1 = value14!;
                        });
                      }),
                  const Text(
                    "Ubnormal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                
                    ),
                    child: const Text("PCC",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue4,
                      onChanged: (value15) {
                        setState(() {
                          groupValue4 = value15!;
                        });
                      }),
                  const Text(
                    "Present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue4,
                      onChanged: (value15) {
                        setState(() {
                          groupValue4 = value15!;
                        });
                      }),
                  const Text(
                    "not present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
          
                    
                    ),
                    child: const Text("BA",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child:Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue10,
                      onChanged: (value16) {
                        setState(() {
                          groupValue10 = value16!;
                        });
                      }),
                  const Text(
                    "Present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue10,
                      onChanged: (value16) {
                        setState(() {
                          groupValue10 = value16!;
                        });
                      }),
                  const Text(
                    "not present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
        
                    
                    ),
                    child: const Text("HTN",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
        
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue5,
                      onChanged: (value17) {
                        setState(() {
                          groupValue5 = value17!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue5,
                      onChanged: (value17) {
                        setState(() {
                          groupValue5 = value17!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
    
                    
                    ),
                    child: const Text("DM",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue6,
                      onChanged: (value18) {
                        setState(() {
                          groupValue6 = value18!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue6,
                      onChanged: (value18) {
                        setState(() {
                          groupValue6 = value18!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("CAD",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
      
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue7,
                      onChanged: (value19) {
                        setState(() {
                          groupValue7 = value19!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue7,
                      onChanged: (value19) {
                        setState(() {
                          groupValue7 = value19!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("PE",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(

                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue8,
                      onChanged: (value20) {
                        setState(() {
                          groupValue8 = value20!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue8,
                      onChanged: (value20) {
                        setState(() {
                          groupValue8 = value20!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
                    
                    ),
                    child: const Text("ANE",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue9,
                      onChanged: (value21) {
                        setState(() {
                          groupValue9 = value21!.toString();
                          
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue9,
                      onChanged: (value21) {
                        setState(() {
                          groupValue9 = value21!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("APPET",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Good",
                      groupValue: groupValue3,
                      onChanged: (value22) {
                        setState(() {
                          groupValue3 = value22!;
                        });
                      }),
                  const Text(
                    "Good",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 42,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Poor",
                      groupValue: groupValue3,
                      onChanged: (value22) {
                        setState(() {
                          groupValue3 = value22!;
                        });
                      }),
                  const Text(
                    "Poor",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
                  ),
                ]),
                   const SizedBox(height: 10),
                          Row(children: [
                  Container(
                    width: 280,
              
                    margin: const EdgeInsets.only(left: 0,top: 2),
                  
                    child: const Text("POT",
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                  
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: 
                    Form(
                      key: formstate12,
                      child: TextFormField(
                        // controller: dosageformController,
                        cursorColor: const Color(0xff0C8A7D),
                        validator: (value12) {
                          if (value12!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ]),

                

                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                            width: 620,
                            height: 80,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(left: 60, top: 20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 91, 189, 179),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Field",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 240,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                            
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                                    Container(
                                      width: 280,
                                      margin: const EdgeInsets.only(
                                          left: 0, top: 2),
                                      decoration: const BoxDecoration(),
                                      child: const Text("PEMO",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate1,
                                        child: TextFormField(
                                          controller: dosageformController,
                                          cursorColor: const Color(0xff0C8A7D),
                                          validator: (value1) {
                                            if (value1!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("PCV",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate2,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value2) {
                                            if (value2!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("WBC",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate3,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          controller: genericnameController,
                                          validator: (value3) {
                                            if (value3!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                    const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      
                                      child: const Text("BP",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate4,
                                        child: TextFormField(
                                            cursorColor:
                                                const Color(0xff0C8A7D),
                                            controller: therapeuticController,
                                            validator: (value4) {
                                              if (value4!.isEmpty) {
                                                return "Required";
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            )),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      
                                      child: const Text("BGR",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate5,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value5) {
                                            if (value5!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                    
                                      child: const Text("BU",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate6,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          controller: manufacturerController,
                                          validator: (value6) {
                                            if (value6!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SC",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate7,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SOD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate8,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SG",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate9,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("AL",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate10,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SU",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate11,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),


                                  

                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                          color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Save",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          if (formstate1.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate2.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate3.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate4.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate5.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate6.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate7.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate8.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate9.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate10.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate11.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate12.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                        }),
                  ),  const SizedBox(
                    width: 40,),
  SizedBox(
                    width: 200,
                    child: MaterialButton(
                        color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Check",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          
                        }),
                  ),

                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                        color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),

                ]),
                  const SizedBox(
                    height: 40,),
                  Center(
                    child: Container(
                      color: const Color.fromARGB(255, 239, 236, 236),
                      
                      width: 200,
                      
                      child: const Text("",
                          style: TextStyle(
                            color:Color(0xff0C8A7D),
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                  ),
  const SizedBox(
                    height: 40,)

                                  ],
                                )
                               
                              )
                              
                            ])))));
              });                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                "images/plus.png"),
                                                            const SharedColorTextblack(
                                                                text: "Add",
                                                                fontSize: 18)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        height: 110,
                                        width: 420,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    const Color(0xff0C8A7D))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SharedColorTextCADnormal(
                                                text: "Scan", fontSize: 26),
                                            Row(
                                              children: [
                                                Container(
                                                    color:
                                                        const Color(0xff0C8A7D),
                                                    height: 50,
                                                    width: 300,
                                                    child: MaterialButton(
                                                      onPressed: () {
                                                        // scan pop up in scan page
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xffFFFFFF),
                                                              content: Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                      children: [
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child: IconButton(
                                                                              icon: const Icon(Icons.clear),
                                                                              color: const Color(0xff0C8A7D),
                                                                              iconSize: 30,
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .all(
                                                                              10),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(children: [
                                                                              //col1
                                                                              Column(children: [
                                                                                Row(children: [
                                                                                  const SizedBox(
                                                                                    width: 180,
                                                                                    //color: Colors.black,
                                                                                    child: Text("Patient name", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(bottom: 15, top: 14),
                                                                                    child: Container(
                                                                                      width: 450,
                                                                                      height: 44,
                                                                                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                      child: const Text("Menna Ali",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xff000000),
                                                                                            fontSize: 20,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                                Row(children: [
                                                                                  const SizedBox(
                                                                                    width: 180,
                                                                                    //color: Colors.black,
                                                                                    child: Text("Patient info", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Container(
                                                                                    width: 450,
                                                                                    height: 45,
                                                                                    decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                    child: const Text("Male_30 Years",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xff000000),
                                                                                          fontSize: 20,
                                                                                        )),
                                                                                  )
                                                                                ]),
                                                                                Row(children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsets.only(top: 9),
                                                                                    child: SizedBox(
                                                                                      width: 180,
                                                                                      //color: Colors.black,
                                                                                      child: Text("Patient ID", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 15),
                                                                                    child: Container(
                                                                                      width: 450,
                                                                                      height: 45,
                                                                                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                      child: const Text("2009022",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xff000000),
                                                                                            fontSize: 20,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                              ]),
                                                                              const SizedBox(width: 50),
                                                                              //col2
                                                                              Column(children: [
                                                                                Row(children: [
                                                                                  const SizedBox(
                                                                                    width: 180,
                                                                                    //color: Colors.black,
                                                                                    child: Text("Doctor name", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(bottom: 15, top: 14),
                                                                                    child: Container(
                                                                                      width: 450,
                                                                                      height: 44,
                                                                                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                      child: const Text("Nada Nasr",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xff000000),
                                                                                            fontSize: 20,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                                Row(children: [
                                                                                  const SizedBox(
                                                                                    width: 180,
                                                                                    //color: Colors.black,
                                                                                    child: Text("Date", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Container(
                                                                                    width: 450,
                                                                                    height: 45,
                                                                                    decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                    child: const Text("19/4/2024",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xff000000),
                                                                                          fontSize: 20,
                                                                                        )),
                                                                                  )
                                                                                ]),
                                                                                Row(children: [
                                                                                  const Padding(
                                                                                    padding: EdgeInsets.only(top: 9),
                                                                                    child: SizedBox(
                                                                                      width: 180,
                                                                                      //color: Colors.black,
                                                                                      child: Text("Class", style: TextStyle(fontSize: 30, color: Color(0xff096B61), fontWeight: FontWeight.w400)),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 15),
                                                                                    child: Container(
                                                                                      width: 450,
                                                                                      height: 45,
                                                                                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                                      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                                                                      child: const Text("Yes",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xff000000),
                                                                                            fontSize: 20,
                                                                                          )),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                              ])
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                20),
                                                                        const Divider(
                                                                            color:
                                                                                Color(0xff096B61)),
                                                                        const SizedBox(
                                                                            height:
                                                                                20),
                                                                        Container(
                                                                          //padding: EdgeInsets.all(20),
                                                                          width:
                                                                              990,
                                                                          height:
                                                                              600,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(style: BorderStyle.solid, color: const Color(0xff096B61))),
                                                                        )
                                                                      ]),
                                                                ),
                                                              )),
                                                            );
                                                          },
                                                        );

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                      },
                                                      child:
                                                          const SharedColorTextWhite(
                                                        text: "2 feb 2023",
                                                        fontSize: 18,
                                                      ),
                                                    )),
                                                Container(
                                                    height: 40,
                                                    width: 80,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return ListView(
                                                                    children: [
                                                                      AlertDialog(
                                                                          title:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            child: IconButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                icon: const Icon(Icons.close_rounded)),
                                                                          ),
                                                                          content:
                                                                              Container(
                                                                            // height: 300,
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                      margin: const EdgeInsets.all(10),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 200,
                                                                                            height: 60,
                                                                                            margin: const EdgeInsets.only(right: 8),
                                                                                            alignment: Alignment.center,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            child: const SharedColorTextCADnormal(text: "Patient name", fontSize: 26),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 300,
                                                                                            height: 60,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            // child: Text("data"),
                                                                                          )
                                                                                        ],
                                                                                      )),
                                                                                  Container(
                                                                                      margin: const EdgeInsets.all(10),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 200,
                                                                                            height: 60,
                                                                                            margin: const EdgeInsets.only(right: 8),
                                                                                            alignment: Alignment.center,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            child: const SharedColorTextCADnormal(text: "Doctor name", fontSize: 26),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 300,
                                                                                            height: 60,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            // child: Text("data"),
                                                                                          )
                                                                                        ],
                                                                                      )),
                                                                                  Container(
                                                                                      margin: const EdgeInsets.all(10),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 200,
                                                                                            height: 60,
                                                                                            margin: const EdgeInsets.only(right: 8),
                                                                                            alignment: Alignment.center,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            child: const SharedColorTextCADnormal(text: "Assistant name", fontSize: 26),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 300,
                                                                                            height: 60,
                                                                                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0C8A7D)), borderRadius: BorderRadius.circular(10)),
                                                                                            // child: Text("data"),
                                                                                          )
                                                                                        ],
                                                                                      )),
                                                                                  Container(
                                                                                    height: 280,
                                                                                    width: 550,
                                                                                    margin: const EdgeInsets.only(bottom: 5),
                                                                                    child: MaterialButton(
                                                                                      padding: const EdgeInsets.all(50),
                                                                                      onPressed: () {
                                                                                        // upload image from pc
                                                                                        _pickImage();
                                                                                      },
                                                                                      child: _pickedImage == null
                                                                                          ? Column(
                                                                                              children: [
                                                                                                Image.asset("images/upload (2) 1.png"),
                                                                                                const Text(
                                                                                                  "upload image",
                                                                                                  style: TextStyle(color: Color(0xff8B8989), fontWeight: FontWeight.bold, fontSize: 30),
                                                                                                ),
                                                                                                const Text(
                                                                                                  "choose file",
                                                                                                  style: TextStyle(color: Color(0xff8B8989), fontWeight: FontWeight.w500, fontSize: 26),
                                                                                                ),
                                                                                              ],
                                                                                            )
                                                                                          : kIsWeb
                                                                                              ? Image.memory(
                                                                                                  webImage,
                                                                                                  fit: BoxFit.fill,
                                                                                                )
                                                                                              : Image.file(
                                                                                                  _pickedImage!,
                                                                                                  fit: BoxFit.fill,
                                                                                                ),
                                                                                    ),
                                                                                  ),
                                                                                  MaterialButton(
                                                                                    color: const Color(0xff0C8A7D),
                                                                                    textColor: Colors.white,
                                                                                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "Save",
                                                                                      style: TextStyle(fontSize: 26),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                  "images/plus.png"),
                                                              const SharedColorTextblack(
                                                                  text: "Add",
                                                                  fontSize: 18)
                                                            ],
                                                          ),
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              // medicine
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                      top: 8, right: 20, left: 20, bottom: 8),
                                  color: Colors.white,
                                  height: 350,
                                  width: 430,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SharedColorTextCADBold(
                                          text: "Medicine", fontSize: 34),
                                      medic()
                                      // CarouselDemo(),
                                    ],
                                  )),
                              // follow up & Prescription
                              Container(
                                color: Colors.white,
                                height: 350,
                                width: 210,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      child: Material(
                                          elevation: 3,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          shadowColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child:
                                              // follow up
                                              SizedBox(
                                                  height: 140,
                                                  width: 200,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: MaterialButton(
                                                        height: 140,
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Follow()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                                "images/schedule 1.png"),
                                                            const SharedColorTextblack(
                                                                text:
                                                                    "Follow up",
                                                                fontSize: 24),
                                                          ],
                                                        ),
                                                      )))),
                                    ),
                                    // Prescription
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: Material(
                                          elevation: 3,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          shadowColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: MaterialButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Prescription()));
                                                  },
                                                  child: Container(
                                                    height: 140,
                                                    width: 200,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            "images/medical-prescription 1.png"),
                                                        const SharedColorTextblack(
                                                            text:
                                                                "Prescription",
                                                            fontSize: 24),
                                                      ],
                                                    ),
                                                  )))),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          // history
                          const SharedColorTextCADnormal(
                              text: "History", fontSize: 36),
                          // diabetes & pressure
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  height: 350,
                                  width: 540,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SharedColorTextCADnormal(
                                              text: "Diabetes", fontSize: 24),
                                          Image.asset(
                                            "images/Glucometer.png",
                                            height: 30,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          width: 490,
                                          height: 280,
                                          child: SfCartesianChart(
                                              legend: const Legend(
                                                  toggleSeriesVisibility: false,
                                                  overflowMode:
                                                      LegendItemOverflowMode
                                                          .scroll),
                                              primaryXAxis:
                                                  const CategoryAxis(),
                                              series: <CartesianSeries>[
                                                SplineSeries<CharttData,
                                                    String>(
                                                  legendIconType:
                                                      LegendIconType.seriesType,
                                                  dataSource: [
                                                    CharttData(
                                                        'Sun',
                                                        120,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Mon',
                                                        200,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Tue',
                                                        150,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Wed',
                                                        160,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Thurs',
                                                        250,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Fri',
                                                        200,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                    CharttData(
                                                        'Sat',
                                                        550,
                                                        const Color.fromARGB(
                                                            255, 31, 111, 177)),
                                                  ],
                                                  // Bind the color for all the data points from the data source
                                                  pointColorMapper:
                                                      (CharttData data, _) =>
                                                          data.color,
                                                  xValueMapper:
                                                      (CharttData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (CharttData data, _) =>
                                                          data.y,
                                                  markerSettings:
                                                      const MarkerSettings(
                                                          isVisible: true,
                                                          height: 5,
                                                          width: 5),
                                                ),
                                              ])),
                                    ],
                                  )),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(left: 15),
                                  color: Colors.white,
                                  height: 350,
                                  width: 540,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SharedColorTextCADnormal(
                                              text: "Presure", fontSize: 24),
                                          Image.asset(
                                            "images/Tonometer.png",
                                            height: 30,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 490,
                                        height: 280,
                                        child: SfCartesianChart(
                                            legend: const Legend(
                                                toggleSeriesVisibility: false,
                                                isVisible: true,
                                                iconHeight: 15,
                                                iconWidth: 15,
                                                //  image: const AssetImage("assetName"),
                                                overflowMode:
                                                    LegendItemOverflowMode
                                                        .wrap),
                                            primaryXAxis: const CategoryAxis(),
                                            series: <CartesianSeries>[
                                              ColumnSeries<Chartdata, String>(
                                                  dataSource: chartData,
                                                  name: "high",
                                                  xValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.y,
                                                  color: const Color.fromARGB(
                                                      231, 179, 218, 254),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              ColumnSeries<Chartdata, String>(
                                                  name: "low",
                                                  dataSource: chartData,
                                                  xValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.y2,
                                                  color: Colors.pink[100],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                            ]),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          // water & walking & exersice
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.white,
                                    height: 280,
                                    width: 355,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SharedColorTextCADnormal(
                                                text: "Exercise", fontSize: 24),
                                            Image.asset(
                                              "images/Gymnastics Skin Type 1.png",
                                              height: 35,
                                              width: 35,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 220,
                                          width: 350,
                                          child: SfCartesianChart(
                                              legend: const Legend(
                                                  toggleSeriesVisibility: false,
                                                  overflowMode:
                                                      LegendItemOverflowMode
                                                          .wrap),
                                              primaryXAxis:
                                                  const CategoryAxis(),
                                              primaryYAxis: const NumericAxis(),
                                              // tooltipBehavior: _tooltip,
                                              series: <CartesianSeries<
                                                  _ChartData, String>>[
                                                AreaSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  gradient: gradientColors,
                                                ),
                                              ]),
                                        )
                                      ],
                                    )),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 5),
                                    color: Colors.white,
                                    height: 280,
                                    width: 355,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SharedColorTextCADnormal(
                                                text: "Walking", fontSize: 24),
                                            Image.asset(
                                              "images/Walking.png",
                                              height: 30,
                                              width: 30,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 350,
                                          height: 220,
                                          child: SfCartesianChart(
                                              legend: const Legend(
                                                  toggleSeriesVisibility: false,
                                                  overflowMode:
                                                      LegendItemOverflowMode
                                                          .wrap),
                                              primaryXAxis:
                                                  const CategoryAxis(),
                                              series: <CartesianSeries>[
                                                // Render column series
                                                ColumnSeries<_ChartData,
                                                        String>(
                                                    dataSource: data,
                                                    xValueMapper:
                                                        (_ChartData data, _) =>
                                                            data.x,
                                                    yValueMapper:
                                                        (_ChartData data, _) =>
                                                            data.y,
                                                    color: const Color.fromARGB(
                                                        222, 229, 194, 79),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                              ]),
                                        )
                                      ],
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(left: 15),
                                  color: Colors.white,
                                  height: 280,
                                  width: 355,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SharedColorTextCADnormal(
                                              text: "Water", fontSize: 24),
                                          Image.asset(
                                            "images/water-drop 1.png",
                                            height: 33,
                                            width: 20,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 400,
                                        height: 220,
                                        child: SfCartesianChart(
                                            legend: const Legend(
                                                toggleSeriesVisibility: true,
                                                overflowMode:
                                                    LegendItemOverflowMode
                                                        .wrap),
                                            primaryXAxis: const CategoryAxis(),
                                            series: <CartesianSeries>[
                                              // Render column series
                                              ColumnSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  dataLabelSettings:
                                                      const DataLabelSettings(
                                                          isVisible: false),
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  color: const Color.fromARGB(
                                                      231, 179, 218, 254),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
      ),
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

class SharedColorTextblack extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextblack(
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
          color: color ?? const Color.fromARGB(255, 0, 0, 0),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

class SharedColorTextWhite extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorTextWhite(
      {super.key,
      this.color,
      this.fontWeight = FontWeight.w100,
      required this.text,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color.fromARGB(255, 255, 255, 255),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

Widget buildGenerateReportButton(BuildContext context) {
  return Container(
    height: 50,
    width: 200,
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
              const SharedColorTextblack(
                  fontWeight: FontWeight.normal,
                  text: "Generate report",
                  fontSize: 20),
              Image.asset(
                "images/arrow.png",
                height: 30,
                width: 35,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // onChanged: (val) {
      //   textval = val;
      // },
      maxLength: 350,
      maxLines: 5,
      minLines: 1,
      cursorColor: Color(0XFF0C8A7D),
      decoration: InputDecoration(
        hintText: 'Enter your note',
      ),
    );
  }
}

String? textval;

Widget medicine() {
  return Container(
    padding: const EdgeInsets.all(30),
    child: const Column(
      children: [
        SharedColorTextCADBold(text: "Rowatinex", fontSize: 24),
        SharedColorTextblack(
            text: "one capsule three time a day ", fontSize: 20),
        SharedColorTextblack(text: "100 MG", fontSize: 20),
        Divider(color: Colors.black),
        Row(
          children: [
            SharedColorTextCADnormal(
                text: "prescription number: ", fontSize: 20),
            SharedColorTextblack(text: "1245", fontSize: 20)
          ],
        ),
        Row(
          children: [
            SharedColorTextCADnormal(text: "prescribed: ", fontSize: 20),
            SharedColorTextblack(text: "15 JAN 2024", fontSize: 20)
          ],
        ),
      ],
    ),
  );
}

class CharttData {
  CharttData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class Chartdata {
  Chartdata(this.x, this.y, this.y2);
  final String x;
  final double y;
  final double y2;
}

final List<Widget> medicines = [
  medicine(),
  medicine(),
  medicine(),
  medicine(),
  medicine(),
  medicine(),
  medicine(),
];

class ChartData {
  ChartData(this.x, this.y, this.Color, this.text);
  final String x;
  final double y;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Color;
  final String text;
}

Widget medic() {
  return CarouselSlider.builder(
    itemCount: medicines.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        Container(
      child: medicine(),
    ),
    options: CarouselOptions(
      height: 250,
      aspectRatio: 16 / 9,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: true,
      autoPlay: false,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: (index, reason) {},
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget ScanDatial(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xff6DB9B1),
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
          // scan pop up for scan page
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color(0xffFFFFFF),
                content: Expanded(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon: const Icon(Icons.clear),
                            color: const Color(0xff0C8A7D),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            //col1
                            Column(children: [
                              Row(children: [
                                const SizedBox(
                                  width: 180,
                                  //color: Colors.black,
                                  child: Text("Patient name",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff096B61),
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 14),
                                  child: Container(
                                    width: 450,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("Menna Ali",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  ),
                                )
                              ]),
                              Row(children: [
                                const SizedBox(
                                  width: 180,
                                  //color: Colors.black,
                                  child: Text("Patient info",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff096B61),
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 450,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xff096B61))),
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 5, bottom: 5),
                                  child: const Text("Male_30 Years",
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 20,
                                      )),
                                )
                              ]),
                              Row(children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 9),
                                  child: SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Patient ID",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("2009022",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  ),
                                )
                              ]),
                            ]),
                            const SizedBox(width: 50),
                            //col2
                            Column(children: [
                              Row(children: [
                                const SizedBox(
                                  width: 180,
                                  //color: Colors.black,
                                  child: Text("Doctor name",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff096B61),
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 14),
                                  child: Container(
                                    width: 450,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("Nada Nasr",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  ),
                                )
                              ]),
                              Row(children: [
                                const SizedBox(
                                  width: 180,
                                  //color: Colors.black,
                                  child: Text("Date",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff096B61),
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 450,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xff096B61))),
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 5, bottom: 5),
                                  child: const Text("19/4/2024",
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 20,
                                      )),
                                )
                              ]),
                              Row(children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 9),
                                  child: SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Class",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("Yes",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  ),
                                )
                              ]),
                            ])
                          ]),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Color(0xff096B61)),
                      const SizedBox(height: 20),
                      Container(
                        //padding: EdgeInsets.all(20),
                        width: 990,
                        height: 600,
                        decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: const Color(0xff096B61))),
                      )
                    ]),
                  ),
                )),
              );
            },
          );

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
        },
        child: Container(
          alignment: Alignment.centerLeft,
          // width: 600,
          height: 110,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedColorTextWhite(
                    text: "2/10/2024",
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  SharedColorTextWhite(
                    text: "Ahmed elkateeb",
                    fontSize: 16,
                  )
                ],
              ),
            )
          ]),
        ),
      ));
}

class testdatail extends StatelessWidget {
  testdatail({super.key});
  final List test1 = [
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
  List test2 = [
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
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xff6DB9B1),
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
            // view test pop up for test page
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xffFFFFFF),
                  content: Expanded(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: const Icon(Icons.clear),
                              color: const Color(0xff0C8A7D),
                              iconSize: 30,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              //col1
                              Column(children: [
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Patient name",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 14),
                                    child: Container(
                                      width: 450,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("Mona Said",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Patient info",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("Male_30 Years",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  )
                                ]),
                                Row(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: SizedBox(
                                      width: 180,
                                      //color: Colors.black,
                                      child: Text("Patient ID",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Color(0xff096B61),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: 450,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("2009023",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                              ]),
                              const SizedBox(width: 50),
                              //col2
                              Column(children: [
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Doctor name",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 14),
                                    child: Container(
                                      width: 450,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("Ali Samy",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Date",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("21/4/2024",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  )
                                ]),
                                Row(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: SizedBox(
                                      width: 180,
                                      //color: Colors.black,
                                      child: Text("Class",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Color(0xff096B61),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: 450,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("Yes",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                              ])
                            ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: Color(0xff096B61)),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              //col1
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test details",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400)),
                                          Text("Result",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                ),
                                ...List.generate(test1.length, (index) {
                                  return Container(
                                    child: Row(children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                            test1[index]["Test details"],
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(width: 70),
                                      const Text(":",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(width: 90),
                                      SizedBox(
                                        width: 60,
                                        child: Text("$index",
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      )
                                    ]),
                                  );
                                }),
                              ]),
                              const SizedBox(width: 200),
                              //col2
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test details",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400)),
                                          Text("Result",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                ),
                                ...List.generate(test2.length, (index) {
                                  return Container(
                                    child: Row(children: [
                                      const SizedBox(width: 100),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                            test2[index]["Test details"],
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(width: 70),
                                      const Text(":",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(width: 90),
                                      SizedBox(
                                        width: 200,
                                        child: Text(test2[index]["Result"],
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
          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: 300,
            height: 110,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(25),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SharedColorTextWhite(
                      text: "2/10/2024",
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                    SharedColorTextWhite(
                      text: "Ahmed elkateeb",
                      fontSize: 16,
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

class TestContainer extends StatelessWidget {
  TestContainer({super.key});
  final List test1 = [
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
  List test2 = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff0C8A7D),
        height: 50,
        width: 300,
        child: MaterialButton(
          onPressed: () {
            // view test pop up
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xffFFFFFF),
                  content: Expanded(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: const Icon(Icons.clear),
                              color: const Color(0xff0C8A7D),
                              iconSize: 30,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              //col1
                              Column(children: [
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Patient name",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 14),
                                    child: Container(
                                      width: 450,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("Mona Said",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Patient info",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("Male_30 Years",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  )
                                ]),
                                Row(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: SizedBox(
                                      width: 180,
                                      //color: Colors.black,
                                      child: Text("Patient ID",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Color(0xff096B61),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: 450,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("2009023",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                              ]),
                              const SizedBox(width: 50),
                              //col2
                              Column(children: [
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Doctor name",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 14),
                                    child: Container(
                                      width: 450,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text("Ali Samy",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 180,
                                    //color: Colors.black,
                                    child: Text("Date",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xff096B61),
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 450,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 5, bottom: 5),
                                    child: const Text("21/4/2024",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                        )),
                                  )
                                ]),
                                Row(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 9),
                                    child: SizedBox(
                                      width: 180,
                                      //color: Colors.black,
                                      child: Text("Class",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Color(0xff096B61),
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: 450,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.solid,
                                              color: const Color(0xff096B61))),
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: const Text(".........",
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                          )),
                                    ),
                                  )
                                ]),
                              ])
                            ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: Color(0xff096B61)),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              //col1
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test details",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400)),
                                          Text("Result",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                ),
                                ...List.generate(test1.length, (index) {
                                  return Container(
                                    child: Row(children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                            test1[index]["Test details"],
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(width: 70),
                                      const Text(":",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(width: 90),
                                      SizedBox(
                                        width: 60,
                                        child: Text("$index",
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      )
                                    ]),
                                  );
                                }),
                              ]),
                              const SizedBox(width: 200),
                              //col2
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color(0xff096B61))),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test details",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400)),
                                          Text("Result",
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                ),
                                ...List.generate(test2.length, (index) {
                                  return Container(
                                    child: Row(children: [
                                      const SizedBox(width: 100),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                            test2[index]["Test details"],
                                            style: const TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(width: 70),
                                      const Text(":",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(width: 90),
                                      SizedBox(
                                        width: 200,
                                        child: Text(test2[index]["Result"],
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
          },
          child: const SharedColorTextWhite(
            text: "2 feb 2023",
            fontSize: 18,
          ),
        ));
  }
}

class AddTest extends StatefulWidget {
  const AddTest({super.key});

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        color: const Color(0xff0C8A7D),
        onPressed: () {
          // Navigate to add test page
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    backgroundColor: const Color(0xffFFFFFF),
                    content: Expanded(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                child: Column(children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    icon: const Icon(Icons.clear),
                                    color: const Color(0xff0C8A7D),
                                    iconSize: 30,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: 
                                Column(
                                  children: [
                                     Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                            width: 620,
                            height: 80,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(left: 60, top: 20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 91, 189, 179),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Field",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 240,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            
                          ),
                       
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    
                    child: const Text("RBC",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child:
                    Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue,
                      onChanged: (value13) {
                        setState(() {
                          groupValue = value13!;
                        });
                      }),
                  const Text(
                    "Normal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue,
                      onChanged: (value13) {
                        setState(() {
                          groupValue = value13!;
                        });
                      }),
                  const Text(
                    "Ubnormal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
        
                      
                    ),
                    child: const Text("PC",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue1,
                      onChanged: (value14) {
                        setState(() {
                          groupValue1 = value14!;
                        });
                      }),
                  const Text(
                    "Normal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue1,
                      onChanged: (value14) {
                        setState(() {
                          groupValue1 = value14!;
                        });
                      }),
                  const Text(
                    "Ubnormal",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                
                    ),
                    child: const Text("PCC",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue4,
                      onChanged: (value15) {
                        setState(() {
                          groupValue4 = value15!;
                        });
                      }),
                  const Text(
                    "Present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue4,
                      onChanged: (value15) {
                        setState(() {
                          groupValue4 = value15!;
                        });
                      }),
                  const Text(
                    "not present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
          
                    
                    ),
                    child: const Text("BA",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child:Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue10,
                      onChanged: (value16) {
                        setState(() {
                          groupValue10 = value16!;
                        });
                      }),
                  const Text(
                    "Present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue10,
                      onChanged: (value16) {
                        setState(() {
                          groupValue10 = value16!;
                        });
                      }),
                  const Text(
                    "not present",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
        
                    
                    ),
                    child: const Text("HTN",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
        
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue5,
                      onChanged: (value17) {
                        setState(() {
                          groupValue5 = value17!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue5,
                      onChanged: (value17) {
                        setState(() {
                          groupValue5 = value17!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
    
                    
                    ),
                    child: const Text("DM",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
          
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue6,
                      onChanged: (value18) {
                        setState(() {
                          groupValue6 = value18!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue6,
                      onChanged: (value18) {
                        setState(() {
                          groupValue6 = value18!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("CAD",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
      
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue7,
                      onChanged: (value19) {
                        setState(() {
                          groupValue7 = value19!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue7,
                      onChanged: (value19) {
                        setState(() {
                          groupValue7 = value19!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("PE",
                        style: TextStyle(
                                  color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(

                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue8,
                      onChanged: (value20) {
                        setState(() {
                          groupValue8 = value20!;
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue8,
                      onChanged: (value20) {
                        setState(() {
                          groupValue8 = value20!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
                    
                    ),
                    child: const Text("ANE",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue9,
                      onChanged: (value21) {
                        setState(() {
                          groupValue9 = value21!.toString();
                          
                        });
                      }),
                  const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 56,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue9,
                      onChanged: (value21) {
                        setState(() {
                          groupValue9 = value21!;
                        });
                      }),
                  const Text(
                    "No",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
      
                    
                    ),
                    child: const Text("APPET",
                        style: TextStyle(
                                color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   const Color(0xff0C8A7D),
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Good",
                      groupValue: groupValue3,
                      onChanged: (value22) {
                        setState(() {
                          groupValue3 = value22!;
                        });
                      }),
                  const Text(
                    "Good",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                    width: 42,
                  ),
                  Radio(
                    fillColor: const WidgetStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:const Color(0xff0C8A7D),
                      value: "Poor",
                      groupValue: groupValue3,
                      onChanged: (value22) {
                        setState(() {
                          groupValue3 = value22!;
                        });
                      }),
                  const Text(
                    "Poor",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
                  ),
                ]),
                   const SizedBox(height: 10),
                          Row(children: [
                  Container(
                    width: 280,
              
                    margin: const EdgeInsets.only(left: 0,top: 2),
                  
                    child: const Text("POT",
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53,
                    width: 290,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                  
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: 
                    Form(
                      key: formstate12,
                      child: TextFormField(
                        // controller: dosageformController,
                        cursorColor: const Color(0xff0C8A7D),
                        validator: (value12) {
                          if (value12!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ]),

                

                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                            width: 620,
                            height: 80,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(left: 60, top: 20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 91, 189, 179),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Field",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 240,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                            
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                                    Container(
                                      width: 280,
                                      margin: const EdgeInsets.only(
                                          left: 0, top: 2),
                                      decoration: const BoxDecoration(),
                                      child: const Text("PEMO",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate1,
                                        child: TextFormField(
                                          controller: dosageformController,
                                          cursorColor: const Color(0xff0C8A7D),
                                          validator: (value1) {
                                            if (value1!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("PCV",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate2,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value2) {
                                            if (value2!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("WBC",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate3,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          controller: genericnameController,
                                          validator: (value3) {
                                            if (value3!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                    const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      
                                      child: const Text("BP",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate4,
                                        child: TextFormField(
                                            cursorColor:
                                                const Color(0xff0C8A7D),
                                            controller: therapeuticController,
                                            validator: (value4) {
                                              if (value4!.isEmpty) {
                                                return "Required";
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            )),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      
                                      child: const Text("BGR",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate5,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value5) {
                                            if (value5!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                    
                                      child: const Text("BU",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate6,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          controller: manufacturerController,
                                          validator: (value6) {
                                            if (value6!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SC",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate7,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),

                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SOD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate8,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SG",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate9,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("AL",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate10,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: 280,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(),
                                      child: const Text("SU",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 53,
                                      width: 290,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff0C8A7D),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Form(
                                        key: formstate11,
                                        child: TextFormField(
                                          cursorColor: const Color(0xff0C8A7D),
                                          // controller: manufacturerController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required";
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),


                                  

                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                          color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Save",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          if (formstate1.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate2.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate3.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate4.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate5.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate6.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate7.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate8.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate9.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate10.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate11.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                          if (formstate12.currentState!.validate()) {
                            print("valid");
                          } else {
                            print("not valid");
                          }
                        }),
                  ),  const SizedBox(
                    width: 40,),
  SizedBox(
                    width: 200,
                    child: MaterialButton(
                        color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Check",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          
                        }),
                  ),

                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                        color: const Color(0xff0C8A7D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),

                ]),
                  const SizedBox(
                    height: 40,),
                  Center(
                    child: Container(
                      color: const Color.fromARGB(255, 239, 236, 236),
                      
                      width: 200,
                      
                      child: const Text("",
                          style: TextStyle(
                            color:Color(0xff0C8A7D),
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                  ),
  const SizedBox(
                    height: 40,)

                                  ],
                                )
                               
                              )
                              
                            ])))));
              });
        },
        icon: const Icon(Icons.add_circle),
        iconSize: 80,
      ),
    );
  }
}