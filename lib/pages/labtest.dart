import 'package:flutter/material.dart';

class LabTest extends StatefulWidget {
  const LabTest({Key? key}) : super(key: key);

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 500,
                        height: 200,
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset("asset/img/Group.png"),
                            const Text(
                              "Ahmed ali",
                              style: TextStyle(
                                fontSize: 40,
                                color: Color(0xff0C8A7D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 400,
                        height: 100,
                        margin: const EdgeInsets.only(left: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          color: const Color(0xff0C8A7D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Blood analysis",
                                style: TextStyle(
                                    fontSize: 29, color: Colors.white),
                              ),
                              Text(
                                "17/12/2023",
                                style: TextStyle(
                                    fontSize: 29, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 400,
                        height: 100,
                        margin: const EdgeInsets.only(left: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          color: const Color(0xff0C8A7D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Blood analysis",
                                style: TextStyle(
                                    fontSize: 29, color: Colors.white),
                              ),
                              Text(
                                "17/12/2023",
                                style: TextStyle(
                                    fontSize: 29, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 400),
                          alignment: Alignment.center,
                          width: 200,
                          height: 69,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff0C8A7D),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            iconSize: 40,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                              ),
                              Row(children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  width: 280,
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 2),
                                  decoration: const BoxDecoration(),
                                  child: const Text("PEMO",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                                const Text(
                                  ":",
                                  style: TextStyle(
                                      fontSize: 29, color: Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 290,
                                  padding: const EdgeInsets.all(5),
                                  child: const Text(
                                    "16.3",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ])
                            ])),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "5.79",
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Container(
                        width: 280,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(),
                        child: const Text("BP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Container(
                        width: 280,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(),
                        child: const Text("BGR",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Container(
                        width: 280,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(),
                        child: const Text("BU",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                      ),
                    ]),
                    const SizedBox(height: 20),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
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
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 29, color: Colors.black),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 290,
                        padding: const EdgeInsets.all(5),
                      ),
                    ]),
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                  ),
                                  Row(children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: 200,
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 2),
                                      decoration: const BoxDecoration(),
                                      child: const Text("POT",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                          ),
                                          textAlign: TextAlign.left),
                                    ),
                                    const Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 29, color: Colors.black),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      width: 50,
                                      child: const Text(
                                        "Normal",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                  ])
                                ])),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("RBC",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 50,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("PC",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("PCC",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("BA",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("HTN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("DM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("CAD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("PE",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("ANE",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(),
                            child: const Text("APPET",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 29, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                          ),
                        ]),
                      ])
                ]),
          ),
          const SizedBox(
            width: 5,
            height: 40,
          ),
          Center(
            child: Container(
              width: 600,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xff0C8A7D),
                      border: new Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                    child: const Text("Class",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 290,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: new Border.all(
                          color: const Color(0xff0C8A7D),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(32),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
