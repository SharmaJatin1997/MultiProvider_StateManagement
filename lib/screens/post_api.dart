import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/provider/post_provider.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({Key? key}) : super(key: key);

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  late PostApiProvider provider;

  @override
  void initState() {
    provider = Provider.of<PostApiProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 40,
            ),
          ),
          title: const Text("PostApiScreen",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18))),
      body: Consumer<PostApiProvider>(
        builder:(context,value,child){
         return GestureDetector(
              onTap: () {
                value.loginApi();
              },
              child:
              value.isLoading==true?Center(child: CircularProgressIndicator()):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Center(
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Api Hit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        )),
                  ),
                  Spacer(),
                  value.isUserLogin==true?Image.asset("assets/user.png"):Opacity(opacity: 0.1,
                  child: Image.asset("assets/user.png")),
                  value.isUserLogin==true?const Text("UserOnline",style: TextStyle(color: Colors.black),):const Text("UserOffline")

                ],
              )
          );
        },
      ),
    );
  }
}
