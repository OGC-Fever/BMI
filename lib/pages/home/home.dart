import 'package:flutter/material.dart';
import 'package:bmi/pages/home/bmi.dart';
import 'package:bmi/pages/record/record.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calc"),
        actions: <Widget>[
          barBtn(context),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: BMI(),
          ),
        ],
      ),
    );
  }
}

Widget barBtn(context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const RecordPage(),
          ),
        );
      },
      child: Text(
        "Records",
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    ),
  );
}
