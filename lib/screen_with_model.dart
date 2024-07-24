import 'package:flutter/material.dart';
import 'package:single_data/api_services.dart';
import 'package:single_data/model/single.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = false;
  Single? single;

 

  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async {
    ApiServices.getSingle().then((value) {
      setState(() {
        single = value;
        isReady = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('single'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: isReady == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    single?.userId.toString()??"",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    single?.title.toString()??"",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 243, 166, 33)),
                  ),
                  Text(
                    single?.body.toString()??"",
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 33, 243, 65)),
                  )
                ],
              ));
  }
}
