import 'package:flutter/material.dart';

class AddTest extends StatefulWidget {
  const AddTest({Key? key}) : super(key: key);

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
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

  final attributes = ListModel(
    PEMO: 'PEMO',
    PCV: 'PCV',
    WBC: 'WBC',
    BP: 'BP',
    BGR:'BGR',
    BU:'BU',
    SC:'SC',
    SOD:'SOD',
    SG:'SG',
    AL:'AL',
    SU:'SU',
    POT:'POT',
    RBC:'RBC',
    PC:'PC',
    PCC:'PCC',
    BA:'BA',
    HTN:'HTN',
    DM:'DM',
    CAD:'CAD',
    PE:"PE",
    ANE:"ANE",
    APPET:'APPET'


  );
  List<ListModel> AddTest = [
    ListModel(
      PEMO: 'PEMO',
      PCV: 'PCV',
      WBC: 'WBC',
      BP: 'BP',
        BGR:'BGR',
    BU:'BU',
    SC:'SC',
    SOD:'SOD',
    SG:'SG',
    AL:'AL',
    SU:'SU',
    POT:'POT',
    RBC:'RBC',
    PC:'PC',
    PCC:'PCC',
    BA:'BA',
    HTN:'HTN',
    DM:'DM',
    CAD:'CAD',
    PE:"PE",
    ANE:"ANE",
    APPET:'APPET'

    )
  ];
  // List<ListModel> Medicinesname2 = [
  //   ListModel(
  //     Medicinename: 'Aspirinn',
  //     dosage: ' Dosage',
  //     Frequency: ' Frequency',
  //     Duration: ' Duration',
  //     action: 'Action',
  //   )
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
//
SingleChildScrollView(
  child: Column(
    children: [
      Row(
        children: [
      
              Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                 Container(
                width: 620,
                height: 80,
      alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 60,top: 20),
                decoration: BoxDecoration(shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 91, 189, 179),
                ),
      
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(width: 50,),
      Text("Field",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold)),
      SizedBox(width: 240,),
      Text("Value",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold),)
      
              ],),),
            
      
      //         Row(children: [ Text("PEMO")
      //         ,SizedBox(width: 4,)
      
      //         Tex
      
      //         ]
      
      //         ,)
      
      //         ],
      //         ),
      //         SizedBox(width: 60,),
      //         Column(mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      
      //            Container(
      //           width: 600,
      //           height: 70,
      // alignment: Alignment.centerRight,
      //           margin: EdgeInsets.only(left: 40,top: 29),
      //           decoration: BoxDecoration(shape: BoxShape.rectangle,
      //                 color: Color(0xff0C8A7D),
      //           ),
      
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //             SizedBox(width: 60,),
      // Text("Field",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold)),
      // SizedBox(width: 240,),
      // Text("Value",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold),)
      
             
      //       ],),
      //     ]),
      
      //     );
      //   }
      // }
      
                Container(
      
              padding: const EdgeInsets.all(10),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  alignment: Alignment.centerRight,
                  
                ),
                Row(children: [
                  Container(
                    width: 280,
              
                    margin: const EdgeInsets.only(left: 0,top: 2),
                    decoration: BoxDecoration(
                
                    
                    ),
                    child: const Text("PEMO",
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
                  
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
              
                    
                    ),
                    child: const Text("PCV",
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
        
                      
                    ),
                    child: const Text("WBC",
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
      
                
                    ),
                    child: const Text("BP",
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
          
                    
                    ),
                    child: const Text("BGR",
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
        
                    
                    ),
                    child: const Text("BU",
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
        
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
    
                    
                    ),
                    child: const Text("SC",
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
      
                    
                    ),
                    child: const Text("SOD",
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
      
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
      
                    
                    ),
                    child: const Text("SG",
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

                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
                    
                    ),
                    child: const Text("AL",
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
                
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                    decoration: BoxDecoration(
      
                    
                    ),
                    child: const Text("SU",
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
                
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
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
                        ),
                      ),
                    ),
                  ),
                ]),

                
                
              ]),
            ),
        ], 
        
      
         ),
SizedBox(width: 110,),
 Column(
   children: [
     Container(
                    width: 620,
                    height: 80,
          alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 60,top: 10),
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 91, 189, 179),
                    ),
          
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(width: 50,),
          Text("Field",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold)),
          SizedBox(width: 240,),
          Text("Value",style: TextStyle(color: Colors.black,fontSize: 29,fontWeight: FontWeight.bold),)
          
                  ],),),
SizedBox(height: 10,),   
 
  Row(children: [
                  Container(
                    width: 280,
              
                    margin: const EdgeInsets.only(left: 0,top: 2),
                    decoration: BoxDecoration(
                
                    
                    ),
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
                  
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: 
                    Form(
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
                    decoration: BoxDecoration(
              
                    
                    ),
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child:
                    Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
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
                    decoration: BoxDecoration(
        
                      
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Normal",
                      groupValue: groupValue1,
                      onChanged: (value) {
                        setState(() {
                          groupValue1 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "Ubnormal",
                      groupValue: groupValue1,
                      onChanged: (value) {
                        setState(() {
                          groupValue1 = value!;
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
                    decoration: BoxDecoration(
      
                
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue4,
                      onChanged: (value) {
                        setState(() {
                          groupValue4 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue4,
                      onChanged: (value) {
                        setState(() {
                          groupValue4 = value!;
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
                    decoration: BoxDecoration(
          
                    
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child:Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Present",
                      groupValue: groupValue10,
                      onChanged: (value) {
                        setState(() {
                          groupValue10 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "not present",
                      groupValue: groupValue10,
                      onChanged: (value) {
                        setState(() {
                          groupValue10 = value!;
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
                    decoration: BoxDecoration(
        
                    
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
        
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue5,
                      onChanged: (value) {
                        setState(() {
                          groupValue5 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue5,
                      onChanged: (value) {
                        setState(() {
                          groupValue5 = value!;
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
                    decoration: BoxDecoration(
    
                    
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
          
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue6,
                      onChanged: (value) {
                        setState(() {
                          groupValue6 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue6,
                      onChanged: (value) {
                        setState(() {
                          groupValue6 = value!;
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
                    decoration: BoxDecoration(
      
                    
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
      
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue7,
                      onChanged: (value) {
                        setState(() {
                          groupValue7 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue7,
                      onChanged: (value) {
                        setState(() {
                          groupValue7 = value!;
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
                    decoration: BoxDecoration(
      
                    
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

                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue8,
                      onChanged: (value) {
                        setState(() {
                          groupValue8 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue8,
                      onChanged: (value) {
                        setState(() {
                          groupValue8 = value!;
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
                    decoration: BoxDecoration(
                    
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
                
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Yes",
                      groupValue: groupValue9,
                      onChanged: (value) {
                        setState(() {
                          groupValue9 = value!.toString();
                          
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "No",
                      groupValue: groupValue9,
                      onChanged: (value) {
                        setState(() {
                          groupValue9 = value!;
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
                    decoration: BoxDecoration(
      
                    
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
                
                      border: new Border.all(
                          color: Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                    child: Row(
                children: [
                  Radio(
                    activeColor:   Color(0xff0C8A7D),
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                      value: "Good",
                      groupValue: groupValue3,
                      onChanged: (value) {
                        setState(() {
                          groupValue3 = value!;
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
                    fillColor: MaterialStatePropertyAll(Color(0xff0C8A7D)),
                    activeColor:Color(0xff0C8A7D),
                      value: "Poor",
                      groupValue: groupValue3,
                      onChanged: (value) {
                        setState(() {
                          groupValue3 = value!;
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

                

        ]),
        ]),
        SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  Container(
                    width: 200,
                    child: MaterialButton(
                          color: Color(0xff0C8A7D),
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
                  ),  const SizedBox(
                    width: 40,),
  Container(
                    width: 200,
                    child: MaterialButton(
                        color: Color(0xff0C8A7D),
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
                  Container(
                    width: 200,
                    child: MaterialButton(
                        color: Color(0xff0C8A7D),
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
                      color: Color.fromARGB(255, 239, 236, 236),
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
        



        
        ]),
)
);
  }
}

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

  String PEMO, PCV, WBC, BP,BGR,BU,SC,SOD,SG,AL,SU,POT,RBC,PC,PCC,BA,HTN,DM,CAD,PE,ANE,APPET;
}
