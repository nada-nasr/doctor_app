import 'package:flutter/material.dart';

class Addprescription extends StatefulWidget {
  const Addprescription({Key? key}) : super(key: key);

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
  List<ListModel> Medicinesname = [
    ListModel(
      Medicinename: 'Omega',
      dosage: ' Dosage',
      Frequency: ' Frequency',
      Duration: ' Duration',
      action: 'Action',
    )
  ];
  List<ListModel> Medicinesname2 = [
    ListModel(
      Medicinename: 'Aspirinn',
      dosage: ' Dosage',
      Frequency: ' Frequency',
      Duration: ' Duration',
      action: 'Action',
    )
  ];
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
        decoration: BoxDecoration( 
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
                                          color: Color(0xff0C8A7D),
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
                                                    border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                                      border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                                    border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                                      border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                                    border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                                      border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                            border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),                                        child: const Text("Duration",
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
                                                      border: new Border.all(
                                    color: Color(0xff0C8A7D),
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.circular(32),),
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
                                          Container(
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
                                                  if (formstate1.currentState!
                                                      .validate()) {
                                                    print("valid");
                                                  } else {
                                                    print("not valid");
                                                  }
                                                  if (formstate2.currentState!
                                                      .validate()) {
                                                    print("valid");
                                                  } else {
                                                    print("not valid");
                                                  }
                                                  if (formstate3.currentState!
                                                      .validate()) {
                                                    print("valid");
                                                  } else {
                                                    print("not valid");
                                                  }
                                                  if (formstate4.currentState!
                                                      .validate()) {
                                                    print("valid");
                                                  } else {
                                                    print("not valid");
                                                  }
                                                  if (formstate5.currentState!
                                                      .validate()) {
                                                    print("valid");
                                                  } else {
                                                    print("not valid");
                                                  }
                     
                                                  /*String name =
                                                      nameController.text.trim();
                                                  String id =
                                                      idController.text.trim();
                                                  String phone =
                                                      phoneController.text.trim();
                                                  String email =
                                                      emailController.text.trim();
                                                  String role =
                                                      roleController.text.trim();
                                                  if (name.isNotEmpty &&
                                                      id.isNotEmpty &&
                                                      phone.isNotEmpty &&
                                                      email.isNotEmpty &&
                                                      role.isNotEmpty) {
                                                    setState(() {
                                                      nameController.text = '';
                                                      idController.text = '';
                                                      phoneController.text = '';
                                                      emailController.text = '';
                                                      roleController.text = '';
                                                      DoctorList.add(
                                                          CheckBoxModel(
                                                              name: name,
                                                              id: id,
                                                              phone: phone,
                                                              role: role,
                                                              action: email));
                                                    });
                                                  }*/
                                                }),
                                          ),
                                          const SizedBox(width: 40,),
                                          Container(
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
                               
                                   
                                       
                               
                         
    
        
      }, icon: Icon(Icons.add),color: Colors.white,
      iconSize: 50,
      ),
      ),
      backgroundColor: Color.fromARGB(255, 220, 255, 251),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start
        , children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back,size: 40,color: Color(0xff0C8A7D),)),
              Image.asset(
                "assets/img/nephrologist 11.png",
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                  
                    border: new Border.all(
                        color: Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(32),
                  ),
                  child: TextField(
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
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 150),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(28),
                  ),
                  child: Text(
                    "Doctor name",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 15),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 150),
                  width: 410,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(28),
                  ),
                  child: TextField(
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
                  margin: EdgeInsets.only(left: 150, top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: Color(0xff0C8A7D),
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(28),
                  ),
                  child: Text(
                    "Date",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 17),
                  )),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 160, top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(6),
                    ),
                    child: TextField(
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
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff0C8A7D),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 40, top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(6),
                    ),
                    child: TextField(
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
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff0C8A7D),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 40, top: 20),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(6),
                    ),
                    child: TextField(
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
                margin: EdgeInsets.only(left: 90, top: 29),
                width: 600,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(
                      color: Color(0xff0C8A7D),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: new BorderRadius.circular(6),
                ),
                child: Column(children: [
                  SizedBox(height: 20,),
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
                            margin: EdgeInsets.only(left: 32),
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
                            margin: EdgeInsets.only(left: 32),
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
                           ...Medicinesname3.map(
                    (item) => 
                      
                       Column(
                         children: [
              
                           Container(
                            margin: EdgeInsets.only(left: 32),
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
                          
                         ],
                       ),
                    
                  ),
                ]),
              ),
                      ]),
                    ),
                ]),),
SizedBox(width: 400,),
                    Container(
                        margin: EdgeInsets.only(top: 29),
                      width: 299, 
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                              border: new Border.all(
                                  color: Color(0xff0C8A7D),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: new BorderRadius.circular(6),
                            ),
                      child: Column(
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
                    color: Color(0xff0C8A7D),
                borderRadius: BorderRadius.circular(32)
                                    ,),
                                    child: Text("Save",style: TextStyle(color:Colors.white,fontSize: 29)
                                    
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
