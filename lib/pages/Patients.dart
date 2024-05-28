import 'package:doctor_app/pages/Manage.dart';
import 'package:doctor_app/pages/first.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/lab_tests.dart';
import 'package:doctor_app/pages/login.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:doctor_app/pages/notification.dart';
import 'package:doctor_app/pages/patient_profile.dart';
import 'package:doctor_app/pages/reports.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});
  @override
  State<Patients> createState() => _Patients();
}

class _Patients extends State<Patients> {
  bool isSearchClicked = false;
  final TextEditingController _searchController = TextEditingController();
  //String? Role;
  int selectedIndex = -1;
  int index = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodController = TextEditingController();

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

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", nameController.text);
    sharedPreferences.setString("password", passController.text);
    sharedPreferences.setString("date of birth", dobController.text);
    sharedPreferences.setString("phone", phoneController.text);
    sharedPreferences.setString("gender", genController.text);
    sharedPreferences.setString("e_mail", emailController.text);
    sharedPreferences.setString("job", jobController.text);
    sharedPreferences.setString("height", heightController.text);
    sharedPreferences.setString("weight", weightController.text);
    sharedPreferences.setString("blood group", bloodController.text);
  }

  String? gender = "Male";
  int choice = 1;
  bool isSelected = false;
  String? _selectedBloodGroup;
  List<String> bloodgroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];
  List<String> selectedBloodgroups = [];

  final allChecked = CheckBoxModel(
      name: "Name", pass: "Password", phone: "Phone", action: "Action");

  List<CheckBoxModel> PatientsList = [
    CheckBoxModel(
        name: "Menna Ali",
        pass: "2009022",
        phone: "01015678190",
        action: "action"),
    CheckBoxModel(
        name: "Mona Said",
        pass: "2009023",
        phone: "01002958192",
        action: "action"),
    CheckBoxModel(
        name: "Ayat Mohamed",
        pass: "2009024",
        phone: "01054972876",
        action: "action"),
    CheckBoxModel(
        name: "Asma Nasr",
        pass: "2009025",
        phone: "01008356922",
        action: "action")
  ];

  void editPatient(index) {
    // Get the patient to edit based on the provided index
    var patient = PatientsList[index];

    // Create controllers for the text fields
    final nameController = TextEditingController(text: patient.name);
    final passController = TextEditingController(
        text: patient.pass.toString()); // Convert pass to string
    final phoneController = TextEditingController(text: patient.phone);

    // Show the dialog to edit patient details
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Name input field
                TextField(
                  controller: nameController,
                  cursorColor: const Color(0xff0C8A7D),
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle:
                        TextStyle(color: Color(0xff0C8A7D), fontSize: 18),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                  ),
                ),
                // Password input field (disabled)
                TextField(
                  controller: passController,
                  cursorColor: const Color(0xff0C8A7D),
                  keyboardType: TextInputType.number,
                  enabled: false, // Password shouldn't be editable
                  decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Color(0xff0C8A7D), fontSize: 18),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                  ),
                ),
                // Phone input field
                TextField(
                  controller: phoneController,
                  cursorColor: const Color(0xff0C8A7D),
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    labelStyle:
                        TextStyle(color: Color(0xff0C8A7D), fontSize: 18),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0C8A7D)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Update button
          MaterialButton(
            child: const Text(
              "Update",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (nameController.text.isEmpty || phoneController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please fill in name and phone',
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ),
                );
                return;
              }
              // Update the patient data in the PatientsList
              setState(() {
                PatientsList[index] = CheckBoxModel(
                  name: nameController.text,
                  pass: patient.pass, // Keep original password
                  phone: phoneController.text,
                  action: 'action',
                );
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void addPatient() {
    // Clear controllers before showing the dialog
    nameController.text = '';
    passController.text = '';
    phoneController.text = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff0C8A7D),
        content: Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
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
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // col 1
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("Name",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 54,
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Form(
                                            key: formstate1,
                                            child: TextFormField(
                                              controller: nameController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Required";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText: "name",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                      Row(children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("D.O.B",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 54,
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Form(
                                            key: formstate2,
                                            child: TextFormField(
                                              controller: dobController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Required";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText: "date of birth",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                      Row(children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("Phone",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 54,
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Form(
                                            key: formstate3,
                                            child: TextFormField(
                                              controller: phoneController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Required";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText: "phone",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                      Row(children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("Password",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 54,
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Form(
                                            key: formstate4,
                                            child: TextFormField(
                                              controller: passController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Required";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText: "password",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                      Row(children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("E-mail",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 54,
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Form(
                                            key: formstate5,
                                            child: TextFormField(
                                              controller: emailController,
                                              cursorColor:
                                                  const Color(0xff0C8A7D),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Required";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText: "e-mail",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                    ]),

                                const SizedBox(width: 30),

                                //col 2
                                Column(children: [
                                  Row(children: [
                                    Container(
                                      width: 190,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text("Height",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 54,
                                      width: 400,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Form(
                                        key: formstate6,
                                        child: TextFormField(
                                          controller: heightController,
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
                                              hintText: "height",
                                              hintStyle: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200)),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 20),
                                  Row(children: [
                                    Container(
                                      width: 190,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text("Weight",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 54,
                                      width: 400,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Form(
                                        key: formstate7,
                                        child: TextFormField(
                                          controller: weightController,
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
                                              hintText: "weight",
                                              hintStyle: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200)),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 20),
                                  Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 190,
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text("Gender",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          width: 400,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          child: Column(children: [
                                            Row(
                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Radio(
                                                      activeColor: const Color(
                                                          0xffFFFFFF),
                                                      focusColor: const Color(
                                                          0xffFFFFFF),
                                                      value: "Male",
                                                      groupValue: gender,
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              gender = val)),
                                                  const Text("Male",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff000000),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 28)),
                                                ]),
                                            Row(
                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Radio(
                                                      activeColor: const Color(
                                                          0xffFFFFFF),
                                                      value: "Female",
                                                      groupValue: gender,
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              gender = val)),
                                                  const Text("Female",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff000000),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 28)),
                                                ]),
                                          ]),
                                        ),
                                      ]),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 170),
                                    child: Container(
                                      child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 190,
                                              padding: const EdgeInsets.all(5),
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Text("Blood group",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center),
                                            ),
                                            //const SizedBox(width: 165),
                                            Container(
                                                width: 250,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Wrap(
                                                    children: bloodgroups
                                                        .map(
                                                          (bloodgroup) =>
                                                              FilterChip(
                                                            selectedColor:
                                                                const Color(
                                                                    0xfff0C8A7D),
                                                            label: Text(
                                                                bloodgroup),
                                                            selected:
                                                                _selectedBloodGroup ==
                                                                    bloodgroup, // Track selection state
                                                            onSelected: (bool
                                                                selected) {
                                                              setState(() {
                                                                _selectedBloodGroup =
                                                                    selected
                                                                        ? bloodgroup
                                                                        : null; // Update selection
                                                              });
                                                            },
                                                          ),
                                                        )
                                                        .toList())),
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ])
                              ]),
                        ),
                      ),
                    ])))),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              //alignment: Alignment.center,
              width: 160,
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
                  onPressed: () async {
                    if (formstate1.currentState!.validate() &&
                        formstate2.currentState!.validate() &&
                        formstate3.currentState!.validate() &&
                        formstate4.currentState!.validate() &&
                        formstate5.currentState!.validate() &&
                        formstate6.currentState!.validate() &&
                        formstate7.currentState!.validate()) {
                      await saveprefs();
                      final newPatient = CheckBoxModel(
                        name: nameController.text,
                        pass: passController.text.toString(),
                        phone: phoneController.text,
                        action: 'action',
                      );
                      setState(() {
                        PatientsList.add(newPatient);
                      });
                      Navigator.pop(context);
                    }
                  }),
            ),
            SizedBox(
              width: 160,
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
          ]),
        ],
      ),
    );
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
                    const Text("Patients",
                        style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold))
                  ]),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 40,
                  color: const Color(0xfff0C8A7D),
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                ),
                MaterialButton(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Text("Add ",
                        style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 34,
                            fontWeight: FontWeight.bold)),
                    Image.asset("assets/img/Plus.png"),
                  ]),
                  onPressed: () {
                    addPatient();
                  },
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
                    Checkbox(
                        activeColor: const Color(0xff0C8A7D),
                        side: const BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff0C8A7D),
                            width: 2),
                        value: allChecked.value,
                        onChanged: (value) => onAllClicked1(allChecked)),
                    Text(allChecked.name,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(allChecked.pass,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(allChecked.phone,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    Text(allChecked.action,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 36,
                            fontWeight: FontWeight.bold))
                  ]),
            ),
            const Divider(),
            ...PatientsList.map(
              (item) => Expanded(
                child: Card(
                  color: const Color(0xffFFFFFF),
                  child: Expanded(
                    child: Container(
                      color: const Color(0xffFFFFFF),
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(width: 97),
                                Checkbox(
                                    activeColor: const Color(0xff0C8A7D),
                                    side: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color(0xff0C8A7D),
                                        width: 2),
                                    value: item.value,
                                    onChanged: (value) => onItemClicked(item)),
                                const SizedBox(
                                  width: 150,
                                ),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const patient_profile()));
                                  },
                                ),
                                const SizedBox(width: 50),
                                Text(item.pass,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 140),
                                Text(item.phone,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 140),
                                Container(
                                  child: Row(children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        iconSize: 50,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          editPatient(index);
                                        }),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 50,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          setState(() {
                                            PatientsList.removeAt(
                                                PatientsList.indexOf(item));
                                          });
                                        })
                                  ]),
                                ),
                                //const SizedBox(width: 60),
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

  onAllClicked1(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      PatientsList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModel ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
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
/////////////////////////////////////////////////////////////

class CheckBoxModel {
  CheckBoxModel(
      {required this.name,
      required this.pass,
      required this.phone,
      required this.action});

  String name, pass, phone, action;
  bool value = false;
}

class MySearchDelegate extends SearchDelegate {
  List suggestions = [
    "Menna Ali",
    "Mona Said",
    "Ayat Mohamed",
    "Asma Nasr"
  ]; 

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
    return const patient_profile(); //غالبا هيبقى البروفايل بتاع الشخص اللي اختارته
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
