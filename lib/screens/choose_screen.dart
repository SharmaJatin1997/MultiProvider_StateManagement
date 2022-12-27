import 'package:flutter/material.dart';
import 'package:using_provider/screens/get_api.dart';
import 'package:using_provider/screens/post_api.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Choose Provider Screen",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetApiScreen()),
              );
            },
            child: Center(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("GetApiScreen",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostApiScreen()),
            );},
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("PostApiScreen",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
