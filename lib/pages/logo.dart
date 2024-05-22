import 'package:doctor_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _Logo();
}

class _Logo extends State<Logo>{

@override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const Login(),
        ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          color: const Color.fromRGBO(12, 138, 125, 1),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(90, 50, 90, 100),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  width: 350,
                  height: 150,
                  child: Image.asset("assets/img/nephrologisttt.png",
                      width: 350, height: 200, fit: BoxFit.contain),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 200,
                  child: const Text(
                    "KIDNEY CARE",
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 400, 10),
                      alignment: Alignment.center,
                      child: const Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      alignment: Alignment.center,
                      width: 700,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: const LinearProgressIndicator(
                        color: Color.fromRGBO(12, 138, 125, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
