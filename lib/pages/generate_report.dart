import 'package:flutter/material.dart';

class Generatereport extends StatefulWidget {
  const Generatereport({super.key});
  @override
  State<Generatereport> createState() => _Generatereport();
}

class _Generatereport extends State<Generatereport> {
  String? patientname;
  String? concernedauthority;
  String? doctor;
  String? occupation;

  String? choose = "Yes";

  final TextEditingController patientnameController = TextEditingController();
  final TextEditingController concernedauthorityController =
      TextEditingController();
  final TextEditingController doctorController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F6FC),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F6FC),
        title: const Text("Medical report form",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 34,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 30),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 70, left: 50),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formstate1,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (Val) {
                  patientname = Val;
                },
                controller: patientnameController,
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xff0C8A7D),
                decoration: const InputDecoration(
                  labelText: "Patient full name",
                  labelStyle: TextStyle(
                      color: Color(0xff0C8A7D),
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formstate2,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (Val) {
                  concernedauthority = Val;
                },
                controller: concernedauthorityController,
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xff0C8A7D),
                decoration: const InputDecoration(
                  labelText: "Concerned Authority",
                  labelStyle: TextStyle(
                      color: Color(0xff0C8A7D),
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formstate3,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (Val) {
                  doctor = Val;
                },
                controller: doctorController,
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xff0C8A7D),
                decoration: const InputDecoration(
                  labelText: "Doctor",
                  labelStyle: TextStyle(
                      color: Color(0xff0C8A7D),
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formstate4,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (Val) {
                  occupation = Val;
                },
                controller: occupationController,
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xff0C8A7D),
                decoration: const InputDecoration(
                  labelText: "Occupation",
                  labelStyle: TextStyle(
                      color: Color(0xff0C8A7D),
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ),
          //SizedBox(height: 10),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: const Color(0xffF1F6FC),
            child: Row(children: [
              Column(children: [
                Row(children: [
                  const Text("1.1",
                      style: TextStyle(color: Color(0xff0C8A7D), fontSize: 30)),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.only(top: 40),
                    child: const Column(children: [
                      Text("Were medical tests provided?",
                          style: TextStyle(
                              color: Color(0xff000000), fontSize: 30)),
                      Text("If Yes, which tests were seen?",
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 30))
                    ]),
                  )
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                    width: 190,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color(0xff0C8A7D)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Radio(
                              activeColor: const Color(0xff0C8A7D),
                              value: "Yes",
                              groupValue: choose,
                              onChanged: (val) => setState(() => choose = val)),
                          const Text("Yes",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 28))
                        ]),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                    width: 190,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color(0xff0C8A7D)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Radio(
                              activeColor: const Color(0xff0C8A7D),
                              value: "No",
                              groupValue: choose,
                              onChanged: (val) => setState(() => choose = val)),
                          const Text("No",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 28))
                        ]),
                  ),
                ]),
              ]),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(top: 52),
                  color: const Color(0xffF1F6FC),
                  child: const TextField(
                    maxLines: 4,
                    cursorColor: Color(0xff0C8A7D),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                  ),
                ),
              ),
            ]),
          ),

          const SizedBox(height: 20),

          Container(
            color: const Color(0xffF1F6FC),
            height: 60,
            child: Row(children: [
              const Text("1.2",
                  style: TextStyle(color: Color(0xff0C8A7D), fontSize: 30)),
              const SizedBox(width: 12),

              //padding: const EdgeInsets.only(top: 40),
              const Text("Age of the patient at time of accident?",
                  style: TextStyle(color: Color(0xff000000), fontSize: 30)),

              const SizedBox(width: 30),

              Container(
                width: 200,
                height: 40,
                //padding: const EdgeInsets.only(top: 52),
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              )
            ]),
          ),

          const SizedBox(height: 20),

          Container(
            child: Row(children: [
              const Text("1.3",
                  style: TextStyle(color: Color(0xff0C8A7D), fontSize: 30)),
              const SizedBox(width: 12),

              //padding: const EdgeInsets.only(top: 40),
              const Text("Date of examination",
                  style: TextStyle(color: Color(0xff000000), fontSize: 30)),
              const SizedBox(width: 20),

              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10, right: 4),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 4),
                child: const Text("/",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 40)),
              ),

              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10, right: 4),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(right: 4),
                child: const Text("/",
                    style: TextStyle(color: Color(0xff0C8A7D), fontSize: 40)),
              ),

              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10, right: 4),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),

              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(top: 10, right: 4),
                //color: Colors.black,
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
            ]),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(children: [
              const Text("1.4",
                  style: TextStyle(color: Color(0xff0C8A7D), fontSize: 30)),
              const SizedBox(width: 12),
              const Text("Any notes",
                  style: TextStyle(color: Color(0xff000000), fontSize: 30)),
              const SizedBox(width: 20),
              Container(
                width: 500,
                height: 50,
                //padding: const EdgeInsets.only(top: 10),
                color: const Color(0xffF1F6FC),
                child: const TextField(
                  minLines: 1,
                  maxLines: 4,
                  cursorColor: Color(0xff0C8A7D),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)))),
                ),
              ),
              const Spacer(),
              MaterialButton(
                  child: Image.asset("assets/img/printer (2) 1.png"),
                  onPressed: () {}),
            ]),
          )
        ]),
      ),
    );
  }
}



