import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  const Follow({super.key});

  @override
  State<Follow> createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
  backgroundColor: const Color.fromARGB(255, 220, 255, 251),
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 220, 255, 251),
        actions: [
        IconButton(
          onPressed: () {  Navigator.of(context).pop();},
          icon: const Icon(Icons.cancel),
          color: const Color(0xff0C8A7D),
          iconSize: 50,
        ),
      ]),
      body: 
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          
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
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Text("Doctor name",style: TextStyle(  color: Color(0xff0C8A7D),fontSize: 15),)),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 150),
                    width: 410,
                    height: 50,
                    decoration: BoxDecoration(
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
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Text("Date",style: TextStyle(  color: Color(0xff0C8A7D),fontSize: 17),)),
          
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 160, top: 20),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
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
                    SingleChildScrollView(
                      child: Container(
                          
                          margin: const EdgeInsets.only(left: 90,top: 29),
                            width: 600,
                            height: 280,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff0C8A7D),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:
                            SingleChildScrollView(
                              child: Column(children: [ 
                                const SizedBox(height: 20,),
                                const Row( children: [ 
                                  SizedBox(width: 20,),
                                 Text(
                                "Medicine name",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                   Text(
                                "Dosage",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                   Text(
                                "Frequency",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                               Text(
                                "Duration",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                                                              ),
                                                              SizedBox(width: 10,),
                                                  
                                ],
                                                  
                                  
                                ),
                                const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Omega",style: TextStyle(fontSize: 20),),),
                                                    ],
                                                  ),
                                                    const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                    Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Aspirinn",style: TextStyle(fontSize: 20),),),
                                                    ],
                                                  ),
                                                    const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                    Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Vitamin D",style: TextStyle(fontSize: 20),),),
        
        
        
                                                    ],
                                                  ),
                                      
                                                  
                              ],),
                            )
                            ),
                    ),
                    const SizedBox(width: 400,),
                    Container(
                        margin: const EdgeInsets.only(top: 29),
                      width: 299, 
                      height: 280,
                      decoration: BoxDecoration(
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
                  const Divider( height: 50,),
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
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Text("Doctor name",style: TextStyle(  color: Color(0xff0C8A7D),),)),
                    
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 150),
                    width: 410,
                    height: 50,
                    decoration: BoxDecoration(
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
                      border: Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Text("Date",style: TextStyle(  color: Color(0xff0C8A7D),fontSize: 17),)),
          
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 160, top: 20),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
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
                    SingleChildScrollView(
                      child: Container(
                          
                          margin: const EdgeInsets.only(left: 90,top: 29),
                            width: 600,
                            height: 280,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff0C8A7D),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:
                            SingleChildScrollView(
                              child: Column(children: [ 
                                const SizedBox(height: 20,),
                                const Row( children: [ 
                                  SizedBox(width: 20,),
                                 Text(
                                "Medicine name",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                              ),
                              SizedBox(width: 20,),
                                                   Text(
                                "Dosage",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                              ),
                              SizedBox(width: 20,),
                                                   Text(
                                "Frequency",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                              ),
                              SizedBox(width: 20,),
                               Text(
                                "Duration",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0C8A7D),
                                ),
                              ),
                              SizedBox(width: 20,),
                                                  
                                ],
                                                  
                                  
                                ),
                                const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Omega",style: TextStyle(fontSize: 20),),),
                                                    ],
                                                  ),
                                                    const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                    Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Aspirinn",style: TextStyle(fontSize: 20),),),
                                                    ],
                                                  ),
                                                const Divider( height: 40,  color: Color(0xff0C8A7D),),
                                                    Row(
                                                    mainAxisAlignment: MainAxisAlignment.start, 
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      
                                                      Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text("Vitamin D",style: TextStyle(fontSize: 20),),),
        
        
        
                                                    ],
                                                  ),
                                      
                                                  
                              ],),
                            )
                            ),
                    ),
                    const SizedBox(width: 400,),
                    Container(
                        margin: const EdgeInsets.only(top: 29),
                      width: 299, 
                      height: 280,
                      decoration: BoxDecoration(
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
                  const Divider( height: 50,),
        
          ],
        ),
      ),
    );
  }
}
