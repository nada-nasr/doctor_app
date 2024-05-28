// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class Addprescription extends StatefulWidget {
  const Addprescription({super.key});

  @override
  State<Addprescription> createState() => _AddprescriptionState();
}

class _AddprescriptionState extends State<Addprescription> {
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

  final attributes = ListModel(
      Medicinename: 'Medicine name',
      dosage: 'Dosage',
      Frequency: 'Frequency',
      Duration: 'Duration',
      action: 'Action');
  // ignore: non_constant_identifier_names
  List<ListModel> Medicinesname = [
    ListModel(
      Medicinename: 'Omega',
      dosage: ' Dosage',
      Frequency: ' Frequency',
      Duration: ' Duration',
      action: 'Action',
    )
  ];
  // ignore: non_constant_identifier_names
  List<ListModel> Medicinesname2 = [
    ListModel(
      Medicinename: 'Aspirinn',
      dosage: ' Dosage',
      Frequency: ' Frequency',
      Duration: ' Duration',
      action: 'Action',
    )
  ];
    // ignore: non_constant_identifier_names
    List<ListModel> Medicinesname3 = [
    ListModel(
      Medicinename: 'Vitamin D',
      dosage: ' Dosage',
      Frequency: ' Frequency',
      Duration: ' Duration',
      action: 'Action',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: 
      Container( 
        width: 100,
height: 80,
        decoration: const BoxDecoration( 
          shape: BoxShape.circle,
              color: Color(0xff0C8A7D),
        ),
      child: IconButton(onPressed: (){
{showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
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
                                    
                                    Row(children: [
                                      Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
                                                    border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                        child: const Text("Medicine",
                                            style: TextStyle(
                                                    color: Color(0xff0C8A7D),
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
                                                      border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                          child: Form(
                                            key: formstate2,
                                            child: TextFormField(
                                              controller: dosageformController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
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
                                      ),
                                    ]),
                                    Row(children: [
                                      Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
                                                    border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                        child: const Text("Dosage",
                                            style: TextStyle(
                                                    color: Color(0xff0C8A7D),
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
                                                      border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                          child: Form(
                                            key: formstate3,
                                            child: TextFormField(
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
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
                                                ),
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
                                                    border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                        child: const Text("Frequency",
                                            style: TextStyle(
                                                    color: Color(0xff0C8A7D),
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
                                                      border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                          child: Form(
                                            key: formstate4,
                                            child: TextFormField(
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
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
                                                ),
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
                                            border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),                                        child: const Text("Duration",
                                            style: TextStyle(
                                                    color: Color(0xff0C8A7D),
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
                                                      border: Border.all(
                                    color: const Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(32),),
                                          child: Form(
                                            key: formstate5,
                                            child: TextFormField(
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
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
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: MaterialButton(
                                                color: const Color(0xffFFFFFF),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: const Text("Save",
                                                    style: TextStyle(
                                                        color: Color(0xff0C8A7D),
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center),
                                                onPressed: () {
                                                  if (formstate1.currentState != null && formstate1.currentState!.validate()) {
  print("formstate1 is valid");
} else {
  print("formstate1 is not valid");
}

if (formstate2.currentState != null && formstate2.currentState!.validate()) {
  print("formstate2 is valid");
} else {
  print("formstate2 is not valid");
}

if (formstate3.currentState != null && formstate3.currentState!.validate()) {
  print("formstate3 is valid");
} else {
  print("formstate3 is not valid");
}

if (formstate4.currentState != null && formstate4.currentState!.validate()) {
  print("formstate4 is valid");
} else {
  print("formstate4 is not valid");
}

if (formstate5.currentState != null && formstate5.currentState!.validate()) {
  print("formstate5 is valid");
} else {
  print("formstate5 is not valid");
}
                                                }),
                                          ),
                                          const SizedBox(width: 40,),
                                          SizedBox(
                                            width: 150,
                                            child: MaterialButton(
                                                color: const Color(0xffFFFFFF),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: const Text("Cancel",
                                                    style: TextStyle(
                                                        color: Color(0xff0C8A7D),
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }),
                                          )
                                        ])
                                  ]),
                            ),
                          );
                        });}
                               
                                   
                                       
                               
                         
    
        
      }, icon: const Icon(Icons.add),color: Colors.white,
      iconSize: 50,
      ),
      ),
      backgroundColor: const Color.fromARGB(255, 220, 255, 251),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start
        , children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back,size: 40,color: Color(0xff0C8A7D),)),
              Image.asset(
                "assets/img/nephrologist 11.png",
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                  
                    border: Border.all(
                        color: const Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorRadius: Radius.zero,
                    cursorColor: Color(0xff0C8A7D),
                    cursorHeight: 20,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black)),
                  )),
            ],
          ),
          const Divider(
            height: 20,
            color: Color(0xff0C8A7D),
          ),
          const SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 150),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Text(
                    "Doctor name",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 15),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 150),
                  width: 410,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorRadius: Radius.zero,
                    cursorColor: Color(0xff0C8A7D),
                    cursorHeight: 20,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ahmed Ali",
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black)),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 150, top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Text(
                    "Date",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 17),
                  )),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 160, top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const TextField(
                      cursorRadius: Radius.zero,
                      cursorColor: Color(0xff0C8A7D),
                      cursorHeight: 20,
                      cursorWidth: 2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "18",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    width: 29,
                    height: 50,
                
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "/",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff0C8A7D),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40, top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      cursorRadius: Radius.zero,
                      cursorColor: Color(0xff0C8A7D),
                      cursorHeight: 20,
                      cursorWidth: 2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "5",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    width: 29,
                    height: 50,
                  
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "/",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff0C8A7D),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40, top: 20),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      cursorRadius: Radius.zero,
                      cursorColor: Color(0xff0C8A7D),
                      cursorHeight: 20,
                      cursorWidth: 2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "2024",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: const EdgeInsets.only(left: 90, top: 29),
                width: 600,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color(0xff0C8A7D),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(children: [
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const SizedBox(width: 20),
                      Text(attributes.Medicinename,
                          style: const TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Text(attributes.dosage,
                          style: const TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Text(attributes.Frequency,
                          style: const TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Text(attributes.Duration,
                          style: const TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Text(attributes.action,
                          style: const TextStyle(
                              color: Color(0xff0C8A7D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                    ]),
                  ),
                  const Divider(height: 20,),
                  ...Medicinesname.map(
                    (item) => 
                      
                       Column(
                         children: [
              
                           Container(
                            margin: const EdgeInsets.only(left: 32),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text(item.Medicinename,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 75),
                                  Text(item.dosage,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 15),
                                  Text(item.Frequency,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 15),
                                  Text(item.Duration,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 40),
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 20,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          setState(() {
                                            Medicinesname.removeAt(
                                                Medicinesname.indexOf(item));
                                          });
                                        }),
                                  ),
                                ]),
                           ),
                           const Divider(height: 20,),
                           ...Medicinesname2.map(
                    (item) => 
                      
                       Column(
                         children: [
              
                           Container(
                            margin: const EdgeInsets.only(left: 32),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text(item.Medicinename,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 65),
                                  Text(item.dosage,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 17),
                                  Text(item.Frequency,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 15),
                                  Text(item.Duration,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 40),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      iconSize: 20,
                                      color: const Color(0xff0C8A7D),
                                      onPressed: () {
                                        setState(() {
                                          Medicinesname.removeAt(
                                              Medicinesname.indexOf(item));
                                        });
                                      }),
                                ]),
                           ),
                           const Divider(height: 20,),
                           ...Medicinesname3.map(
                    (item) => 
                      
                       Column(
                         children: [
              
                           Container(
                            margin: const EdgeInsets.only(left: 32),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text(item.Medicinename,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 50),
                                  Text(item.dosage,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  const SizedBox(width: 15),
                                  Text(item.Frequency,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 17),
                                  Text(item.Duration,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                  const SizedBox(width: 40),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      iconSize: 20,
                                      color: const Color(0xff0C8A7D),
                                      onPressed: () {
                                        setState(() {
                                          Medicinesname.removeAt(
                                              Medicinesname.indexOf(item));
                                        });
                                      }),
                                ]),
                           ),
                          
                         ],
                       ),
                    
                  ),
                ]),
              ),
                      ]),
                    ),
                ]),),
const SizedBox(width: 400,),
                    Container(
                        margin: const EdgeInsets.only(top: 29),
                      width: 299, 
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xff0C8A7D),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(6),
                            ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                          Text("Any notes",style: TextStyle(fontSize: 29,  color: Color(0xff0C8A7D),),),
                      TextField( 
              
                        textAlign: TextAlign.center,
                        cursorRadius: Radius.zero,
                        cursorColor: Color(0xff0C8A7D),
                        cursorHeight: 20,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "-----------------------",
                            
                            hintStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                        
        
        
                      
                  ]),
                      )


            ],
          ),
          Center(child: MaterialButton(onPressed: (){}, 
          child: Container( 
            alignment: Alignment.center, 
            width: 200, 
            height: 40,
               decoration: BoxDecoration( 
                    color: const Color(0xff0C8A7D),
                borderRadius: BorderRadius.circular(32)
                                    ,),
                                    child: const Text("Save",style: TextStyle(color:Colors.white,fontSize: 29)
                                    
                                    ,),
                                    ),
          ),)
          
          ]),)
    );
  }
}

class ListModel {
  ListModel(
      {required this.Medicinename,
      required this.dosage,
      required this.Frequency,
      required this.Duration,
      required this.action});

  String Medicinename, dosage, Frequency, Duration, action;
}
