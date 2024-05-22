import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  // Define variables to store selected hours and minutes
  int _hour = 9;
  int _minute = 0;
  String _amPm = "Am";

  // Function to handle hour selection using a dropdown menu
  void _selectHour(int? hour) {
    setState(() {
      _hour = hour!;
    });
  }

  // Function to handle minute selection using a dropdown menu
  void _selectMinute(int? minute) {
    setState(() {
      _minute = minute!;
    });
  }

  // Function to handle Am/Pm selection using a dropdown menu
  void _selectAmPm(String? value) {
    if (value != null) {
      setState(() {
        _amPm = value;
      });
    }
  }

  Uint8List? _image;
  io.File? selectedImage;
  late String path;
  String? name;
  String? role;
  String? email;
  String? phone;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", nameController.text);
    sharedPreferences.setString("role", roleController.text);
    sharedPreferences.setString("phone", phoneController.text);
    sharedPreferences.setString("e_mail", emailController.text);
  }

  bool Saturday = false;
  bool Sunday = true;
  bool Monday = true;
  bool Tuesday = true;
  bool Wednesday = true;
  bool Thursday = true;
  bool Friday = false;

  @override
  void initState() {
    super.initState();
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Text("Profile photo",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 32,
                fontWeight: FontWeight.normal)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            child: const Column(children: [
              Icon(
                Icons.camera_alt,
                size: 70,
                color: Color(0xff0C8A7D),
              ),
              Text("Camera",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal))
            ]),
            onPressed: () {
              _pickImageFromCamera();
            },
          ),
          MaterialButton(
            child: const Column(children: [
              Icon(Icons.image, size: 70, color: Color(0xff0C8A7D)),
              Text("Gallery",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal))
            ]),
            onPressed: () {
              _pickImageFromGallery();
            },
          ),
        ]),
      ]),
    );
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = io.File(returnImage.path);
      _image = io.File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = io.File(returnImage.path);
      _image = io.File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  void Saveimage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);
  }

  Future<void> LoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _image = saveimage.getString("imagepath") as Uint8List?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF1F6FC),
        appBar: AppBar(
          backgroundColor: const Color(0xffF1F6FC),
          title: const Text("Edit Profile",
              style: TextStyle(
                  color: Color(0xff0C8A7D),
                  fontSize: 36,
                  fontWeight: FontWeight.normal)),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 30),
        ),
        body: Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                //container1
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color(0xff096B61))),
                  child: Column(children: [
                    // Profile image
                    _image != null
                        ? CircleAvatar(
                            radius: 90, backgroundImage: MemoryImage(_image!))
                        : const CircleAvatar(
                            radius: 90,
                            backgroundColor: Color(0xffF1F6FC),
                            backgroundImage:
                                AssetImage("assets/img/profile.png")),
                    // Change photo button
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                          child: const Text("Change Photo",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 32,
                                  fontWeight: FontWeight.normal)),
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: const Color(0xffF1F6FC),
                                context: context,
                                builder: ((builder) => bottomSheet()));
                          }),
                    ),
                    // Name input field
                    Container(
                      padding: const EdgeInsets.all(15),
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
                            name = Val;
                          },
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D),
                                fontSize: 32,
                                fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                    // Phone input field
                    Container(
                      padding: const EdgeInsets.all(15),
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
                            phone = Val;
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                            labelText: "Phone",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D),
                                fontSize: 32,
                                fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                    // E-mail input field
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: formstate3,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          onSaved: (Val) {
                            email = Val;
                          },
                          controller: emailController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                            labelText: "E_mail",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D),
                                fontSize: 32,
                                fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                    // role input field
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 30),
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
                            role = Val;
                          },
                          controller: roleController,
                          cursorColor: const Color(0xff0C8A7D),
                          decoration: const InputDecoration(
                            labelText: "Role",
                            labelStyle: TextStyle(
                                color: Color(0xff0C8A7D),
                                fontSize: 32,
                                fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0C8A7D)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),

                //container2
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  width: 970,
                  height: 650,
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color(0xff096B61))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 700),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                      color: const Color(0xff0C8A7D))),
                              child: const Text("Working hours",
                                  style: TextStyle(
                                      color: Color(0xff0C8A7D),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center)),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Saturday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Saturday,
                              onChanged: (value) {
                                setState(() {
                                  Saturday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Saturday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Sunday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Sunday,
                              onChanged: (value) {
                                setState(() {
                                  Sunday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Sunday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 30),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("TO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Monday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Monday,
                              onChanged: (value) {
                                setState(() {
                                  Monday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Monday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 30),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("TO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Tuesday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Tuesday,
                              onChanged: (value) {
                                setState(() {
                                  Tuesday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Tuesday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 30),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("TO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Wednesday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Wednesday,
                              onChanged: (value) {
                                setState(() {
                                  Wednesday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Wednesday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 30),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("TO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Thursday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Thursday,
                              onChanged: (value) {
                                setState(() {
                                  Thursday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Thursday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 30),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text("TO",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff096B61)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Hour dropdown menu
                                    DropdownButton<int>(
                                      value: _hour,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        12,
                                        (int index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      onChanged: _selectHour,
                                    ),
                                    const Text(':',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    // Minute dropdown menu
                                    DropdownButton<int>(
                                      value: _minute,
                                      items:
                                          List<DropdownMenuItem<int>>.generate(
                                        60,
                                        (int index) => DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                              '${index.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      onChanged: _selectMinute,
                                    ),
                                    DropdownButton<String>(
                                      value: _amPm,
                                      items: ['Am', 'Pm']
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff000000))),
                                              ))
                                          .toList(),
                                      onChanged:
                                          _selectAmPm, // Function to handle AM/PM selection
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              width: 140,
                              child: const Text("Friday",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Switch(
                              activeColor: const Color(0xff0C8A7D),
                              activeTrackColor: const Color(0xffB0E3DC),
                              inactiveThumbColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: const Color(0xffB0E3DC),
                              value: Friday,
                              onChanged: (value) {
                                setState(() {
                                  Friday = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(Friday ? 'Open' : 'Closed',
                                style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                          ]),
                        ),
                      ]),
                )
              ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  width: 160,
                  child: MaterialButton(
                      color: const Color(0xff0C8A7D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("Save",
                          style: TextStyle(
                              color: const Color(0xffFFFFFF),
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      onPressed: () async{
                        if (formstate1.currentState!.validate() &&
                        formstate2.currentState!.validate() &&
                        formstate3.currentState!.validate() &&
                        formstate4.currentState!.validate()){
                      await saveprefs();
                      Navigator.pop(context);
                        }
                      }),
                ),
                const SizedBox(width: 500),
                Container(
                  width: 160,
                  child: MaterialButton(
                      color: const Color(0xff0C8A7D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("Cancel",
                          style: TextStyle(
                              color: const Color(0xffFFFFFF),
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ]),
            ),
          ]),
        )));
  }
}
