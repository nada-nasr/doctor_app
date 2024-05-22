import 'package:doctor_app/pages/EditManagetProfile.dart';
import 'package:doctor_app/pages/manager_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Manage extends StatefulWidget {
  const Manage({super.key});

  @override
  State<Manage> createState() => _Manage();
}

class _Manage extends State<Manage> {
  String text = '';
  bool isSearchClicked = false;
  final TextEditingController _searchController = TextEditingController();
  String? Role;
  int selectedIndex = -1;
  int index = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", nameController.text);
    sharedPreferences.setString("password", passController.text);
    sharedPreferences.setString("role", roleController.text);
    sharedPreferences.setString("phone", phoneController.text);
    sharedPreferences.setString("e_mail", emailController.text);
  }

  final allChecked = CheckBoxModel(
      name: "Name",
      pass: "Password",
      phone: "Phone",
      role: "Role",
      action: "Action");
  List<CheckBoxModel> DoctorList = [
    CheckBoxModel(
        name: "Nada Nasr",
        pass: "2009001",
        phone: "01015678190",
        role: "Doctor",
        action: "action"),
    CheckBoxModel(
        name: "Ebtehal Ahmed",
        pass: "2009002",
        phone: "01015678192",
        role: "Doctor",
        action: "action"),
    CheckBoxModel(
        name: "Manar Fawzy",
        pass: "2009003",
        phone: "01015678193",
        role: "Doctor",
        action: "action"),
    CheckBoxModel(
        name: "Rahma Anwar",
        pass: "2009004",
        phone: "01015678194",
        role: "Doctor",
        action: "action")
  ];
  List<CheckBoxModel> AssistantList = [
    CheckBoxModel(
        name: "Aya Mohamed",
        pass: "2009001",
        phone: "01015678190",
        role: "Assistant",
        action: "action"),
    CheckBoxModel(
        name: "Salma Yasser",
        pass: "2009002",
        phone: "01015678192",
        role: "Assistant",
        action: "action"),
    CheckBoxModel(
        name: "Mona Ahmed",
        pass: "2009003",
        phone: "01015678193",
        role: "Assistant",
        action: "action"),
    CheckBoxModel(
        name: "Mariam Khaled",
        pass: "2009004",
        phone: "01015678194",
        role: "Assistant",
        action: "action")
  ];

  void editDoctor(int index) {
    var doctor = DoctorList[index]; // Get the patient to edit
    nameController.text = doctor.name;
    passController.text = doctor.pass.toString();
    phoneController.text = doctor.phone;
    roleController.text = doctor.role;
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: nameController,
                        cursorColor: const Color(0xff0C8A7D),
                        decoration: const InputDecoration(
                            labelText: "Name",
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
                        controller: passController,
                        keyboardType: TextInputType.number,
                        enabled: false,
                        decoration: const InputDecoration(
                            labelText: "Password",
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
                        controller: phoneController,
                        decoration: const InputDecoration(
                            labelText: "Phone",
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
                        controller: roleController,
                        decoration: const InputDecoration(
                            labelText: "Role",
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
                    if (nameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        roleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill in name and phone',
                                style: TextStyle(color: Color(0xffFFFFFF)))),
                      );
                      return;
                    }
                    // Update doctor data
                    setState(() {
                      DoctorList[index] = CheckBoxModel(
                        name: nameController.text,
                        pass: doctor.pass, // Keep original password
                        phone: phoneController.text,
                        role: roleController.text,
                        action: 'action',
                      );
                    });
                    Navigator.pop(context);
                  })
            ]));
  }

  void addDoctor() {
    // Clear controllers before showing the dialog
    nameController.text = '';
    passController.text = '';
    phoneController.text = '';
    emailController.text = ''; // Assuming you have an emailController
    roleController.text = ''; // Assuming you have a roleController

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff0C8A7D),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Close button
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    color: const Color(0xffFFFFFF),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // Name Input Field
                _buildInputRow(
                  label: "Name",
                  controller: nameController,
                  formState: formstate1,
                ),
                // Password Input Field
                _buildInputRow(
                  label: "Password",
                  controller: passController,
                  formState: formstate2,
                ),
                // Phone Input Field
                _buildInputRow(
                  label: "Phone",
                  controller: phoneController,
                  formState: formstate3,
                  keyboardType: TextInputType.number,
                ),
                // Email Input Field
                _buildInputRow(
                  label: "E_mail",
                  controller: emailController,
                  formState: formstate4,
                  keyboardType: TextInputType.emailAddress,
                ),
                // Role Selection
                Row(
                  children: [
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Role",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            RadioListTile(
                              activeColor: const Color(0xffFFFFFF),
                              title: const Text(
                                "Doctor",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: "Doctor",
                              groupValue: Role,
                              onChanged: (value) {
                                setState(() {
                                  Role = value;
                                  print(value);
                                });
                              },
                            ),
                            RadioListTile(
                              activeColor: const Color(0xffFFFFFF),
                              title: const Text(
                                "Assistant",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: "Assistant",
                              groupValue: Role,
                              onChanged: (value) {
                                setState(() {
                                  Role = value;
                                  print(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Save and Cancel Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Save Button
                    Container(
                      alignment: Alignment.center,
                      width: 140,
                      child: MaterialButton(
                        color: const Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          // Validate all forms
                          if (formstate1.currentState!.validate() &&
                              formstate2.currentState!.validate() &&
                              formstate3.currentState!.validate() &&
                              formstate4.currentState!.validate() &&
                              Role != null) {
                            await saveprefs();
                            // Create new Doctor object
                            final newDoctor = CheckBoxModel(
                              name: nameController.text,
                              pass: passController.text,
                              phone: phoneController.text,
                              role: Role!,
                              action: 'action',
                            );
                            // Add to the list
                            setState(() {
                              DoctorList.add(newDoctor);
                            });
                            // Close the dialog
                            Navigator.pop(context);
                          } else {
                            print("not valid");
                          }
                        },
                      ),
                    ),
                    // Cancel Button
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: MaterialButton(
                        color: const Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Helper function to create input row with label and text field
  Widget _buildInputRow({
    String label = "",
    required TextEditingController controller,
    required GlobalKey<FormState> formState,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: formState,
              child: TextFormField(
                keyboardType: keyboardType,
                cursorColor: const Color(0xff0C8A7D),
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  //hintText: label,
                  hintStyle: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void editAssistant(int index) {
    var Assistant = AssistantList[index]; // Get the patient to edit
    nameController.text = Assistant.name;
    passController.text = Assistant.pass.toString();
    phoneController.text = Assistant.phone;
    roleController.text = Assistant.role;
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: nameController,
                        cursorColor: const Color(0xff0C8A7D),
                        decoration: const InputDecoration(
                            labelText: "Name",
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
                        controller: passController,
                        keyboardType: TextInputType.number,
                        enabled: false,
                        decoration: const InputDecoration(
                            labelText: "Password",
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
                        controller: phoneController,
                        decoration: const InputDecoration(
                            labelText: "Phone",
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
                        controller: roleController,
                        decoration: const InputDecoration(
                            labelText: "Role",
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
                    if (nameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        roleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill in name and phone',
                                style: TextStyle(color: Color(0xffFFFFFF)))),
                      );
                      return;
                    }
                    // Update doctor data
                    setState(() {
                      AssistantList[index] = CheckBoxModel(
                        name: nameController.text,
                        pass: Assistant.pass, // Keep original password
                        phone: phoneController.text,
                        role: roleController.text,
                        action: 'action',
                      );
                    });
                    Navigator.pop(context);
                  })
            ]));
  }

  void addAssistant() {
    // Clear controllers before showing the dialog
    nameController.text = '';
    passController.text = '';
    phoneController.text = '';
    emailController.text = ''; // Assuming you have an emailController
    roleController.text = ''; // Assuming you have a roleController

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff0C8A7D),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Close button
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    color: const Color(0xffFFFFFF),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // Name Input Field
                _buildInputRow(
                  label: "Name",
                  controller: nameController,
                  formState: formstate1,
                ),
                // Password Input Field
                _buildInputRow(
                  label: "Password",
                  controller: passController,
                  formState: formstate2,
                ),
                // Phone Input Field
                _buildInputRow(
                  label: "Phone",
                  controller: phoneController,
                  formState: formstate3,
                  keyboardType: TextInputType.number,
                ),
                // Email Input Field
                _buildInputRow(
                  label: "E_mail",
                  controller: emailController,
                  formState: formstate4,
                  keyboardType: TextInputType.emailAddress,
                ),
                // Role Selection
                Row(
                  children: [
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Role",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            RadioListTile(
                              activeColor: const Color(0xffFFFFFF),
                              title: const Text(
                                "Doctor",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: "Doctor",
                              groupValue: Role,
                              onChanged: (value) {
                                setState(() {
                                  Role = value;
                                  print(value);
                                });
                              },
                            ),
                            RadioListTile(
                              activeColor: const Color(0xffFFFFFF),
                              title: const Text(
                                "Assistant",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: "Assistant",
                              groupValue: Role,
                              onChanged: (value) {
                                setState(() {
                                  Role = value;
                                  print(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Save and Cancel Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Save Button
                    Container(
                      alignment: Alignment.center,
                      width: 140,
                      child: MaterialButton(
                        color: const Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async{
                          // Validate all forms
                          if (formstate1.currentState!.validate() &&
                              formstate2.currentState!.validate() &&
                              formstate3.currentState!.validate() &&
                              formstate4.currentState!.validate() &&
                              Role != null) {
                            await saveprefs();
                            // Create new Doctor object
                            final newAssistant = CheckBoxModel(
                              name: nameController.text,
                              pass: passController.text,
                              phone: phoneController.text,
                              role: Role!,
                              action: 'action',
                            );
                            // Add to the list
                            setState(() {
                              AssistantList.add(newAssistant);
                            });
                            // Close the dialog
                            Navigator.pop(context);
                          } else {
                            print("not valid");
                          }
                        },
                      ),
                    ),
                    // Cancel Button
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: MaterialButton(
                        color: const Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Manage",
            style: TextStyle(
                color: Color(0xff0C8A7D),
                fontSize: 36,
                fontWeight: FontWeight.bold),
            //textAlign: TextAlign.start
          ),
          actions: [
            Row(children: [
              IconButton(
                  icon: const Icon(Icons.search),
                  color: const Color(0xfff0C8A7D),
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  }),
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
                  addDoctor();
                  addAssistant();
                },
              ),
            ]),
          ],
          backgroundColor: const Color(0xffFFFFFF),
          iconTheme: const IconThemeData(size: 45, color: Color(0xFF0C8A7D)),
          bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                  color: const Color(0xff0C8A7D),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)),
              labelColor: const Color(0xffFFFFFF),
              unselectedLabelColor: const Color(0xff333333),
              overlayColor: const MaterialStatePropertyAll(Color(0xffFFFFFF)),
              splashBorderRadius: BorderRadius.circular(10),
              tabs: [
                Tab(
                  child: Container(
                      // margin: const EdgeInsets.all(5),
                      child: const Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Text("Doctor",
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.center),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  )),
                ),
                Tab(
                  child: Container(
                      child: const Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Text("Assistant",
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.center),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  )),
                )
              ]),
        ),
        body: Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: TabBarView(children: [
              ListView(children: [
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
                        Text(allChecked.role,
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
                ...DoctorList.map(
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
                                    const SizedBox(width: 70),
                                    Checkbox(
                                        activeColor: const Color(0xff0C8A7D),
                                        side: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: Color(0xff0C8A7D),
                                            width: 2),
                                        value: item.value,
                                        onChanged: (value) =>
                                            onItemClicked(item)),
                                    const SizedBox(width: 100),
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
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ]),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ManagerProfile()));
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    Text(item.pass,
                                        style: const TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 36)),
                                    const SizedBox(width: 100),
                                    Text(item.phone,
                                        style: const TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 36)),
                                    const SizedBox(width: 98),
                                    Text(item.role,
                                        style: const TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 36,
                                            fontWeight: FontWeight.normal)),
                                    const SizedBox(width: 120),
                                    Container(
                                      child: Row(children: [
                                        IconButton(
                                            icon: const Icon(Icons.edit),
                                            iconSize: 50,
                                            color: const Color(0xff0C8A7D),
                                            onPressed: () {
                                              editDoctor(index);
                                            }),
                                        IconButton(
                                            icon: const Icon(Icons.delete),
                                            iconSize: 50,
                                            color: const Color(0xff0C8A7D),
                                            onPressed: () {
                                              setState(() {
                                                DoctorList.removeAt(
                                                    DoctorList.indexOf(item));
                                              });
                                            })
                                      ]),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              /////////////////////////////////////////////////
              ListView(children: [
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
                            onChanged: (value) => onAllClicked2(allChecked)),
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
                        Text(allChecked.role,
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
                ...AssistantList.map(
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
                                const SizedBox(width: 72),
                                Checkbox(
                                    activeColor: const Color(0xff0C8A7D),
                                    side: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color(0xff0C8A7D),
                                        width: 2),
                                    value: item.value,
                                    onChanged: (value) => onItemClicked(item)),
                                const SizedBox(width: 100),
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
                                                const ManagerProfile()));
                                  },
                                ),
                                const SizedBox(width: 13),
                                Text(item.pass,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 100),
                                Text(item.phone,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36)),
                                const SizedBox(width: 80),
                                Text(item.role,
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal)),
                                const SizedBox(width: 110),
                                Container(
                                  child: Row(children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        iconSize: 50,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          editAssistant(index);
                                        }),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 50,
                                        color: const Color(0xff0C8A7D),
                                        onPressed: () {
                                          setState(() {
                                            AssistantList.removeAt(
                                                AssistantList.indexOf(item));
                                          });
                                        })
                                  ]),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  onAllClicked1(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      DoctorList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onAllClicked2(CheckBoxModel ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      AssistantList.forEach((element) {
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

class CheckBoxModel {
  CheckBoxModel(
      {required this.name,
      required this.pass,
      required this.phone,
      required this.role,
      required this.action});

  String name, pass, phone, role, action;
  bool value = false;
}

class MySearchDelegate extends SearchDelegate {
  List suggestions = [
    "Nada",
    "Ebtehal",
    "Manar",
    "Rahma"
  ]; //المفروض من الداتابيز

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
    return const ManagerProfile(); //غالبا هيبقى البروفايل بتاع الشخص اللي اختارته
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
