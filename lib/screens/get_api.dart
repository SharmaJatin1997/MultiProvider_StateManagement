import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/provider/get_provider.dart';

class GetApiScreen extends StatefulWidget {
  GetApiScreen({Key? key}) : super(key: key);

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  late GetApiProvider getProvider;

  @override
  void initState() {
    getProvider = Provider.of<GetApiProvider>(context, listen: false);
    getProvider.getSupervisorInfo();
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
          title: const Text("GetApiScreen",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18))),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<GetApiProvider>(
              builder: (context, value, child) {
                return value.isLoading==true?Center(child: CircularProgressIndicator()):Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.supervisorInfo.length,
                        itemBuilder: (context, index) {
                          return Text(value.supervisorInfo[index]?.name ?? "");
                        }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
