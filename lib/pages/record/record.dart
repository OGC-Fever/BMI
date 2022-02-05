import 'package:flutter/material.dart';
import 'package:bmi/main.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({key}) : super(key: key);

  @override
  _RecodePageState createState() {
    return _RecodePageState();
  }
}

class _RecodePageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Records"),
        ),
        body: recData.count() > 0 ? recordList() : nullList());
  }
}

Widget nullList() {
  return const Center(
      child: Text(
    "~No Data~",
    style: TextStyle(fontSize: 30),
  ));
}

Widget recordList() {
  return ListView.builder(
    itemCount: recData.count(),
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          onLongPress: () {
            recData.remove(index + 1);
            recordList();
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("BMI : "),
              Text(
                recData.get(index + 1) != null
                    ? recData.get(index + 1)!.bmi.toString()
                    : "null",
                style: TextStyle(
                    color: recData.get(index + 1) != null
                        ? Color(recData.get(index + 1)!.color)
                        : Colors.black),
              )
            ],
          ),
          //   subtitle: Column(
          //     children: [
          //       const Divider(),
          //       Row(
          //         children: [
          //           const Expanded(flex: 1, child: Text("Height")),
          //           Expanded(
          //               flex: 1,
          //               child: Center(
          //                   child:
          //                       Text(recData.get(index + 1)!.height.toString()))),
          //           const Expanded(flex: 1, child: Center(child: Text("Date"))),
          //         ],
          //       ),
          //       const Divider(),
          //       Row(
          //         children: [
          //           const Expanded(flex: 1, child: Text("Weight")),
          //           Expanded(
          //               flex: 1,
          //               child: Center(
          //                 child: Text(
          //                   recData.get(index + 1)!.weight.toString(),
          //                 ),
          //               )),
          //           Expanded(
          //             flex: 1,
          //             child: Center(
          //               child: Text(DateFormat("yyyy/MM/dd")
          //                   .format(recData.get(index + 1)!.datetime)),
          //             ),
          //           ),
          //         ],
          //       ),
          //       const Divider(),
          //       Row(
          //         children: [
          //           const Expanded(flex: 1, child: Text("Note")),
          //           Expanded(
          //               flex: 1,
          //               child: Center(
          //                   child: Text(
          //                 recData.get(index + 1)!.note.toString(),
          //                 style: TextStyle(
          //                     color: Color(recData.get(index + 1)!.color)),
          //               ))),
          //           Expanded(
          //               flex: 1,
          //               child: Center(
          //                 child: Text(DateFormat("HH:mm E")
          //                     .format(recData.get(index + 1)!.datetime)),
          //               ))
          //         ],
          //       ),
          //     ],
          //   ),
        ),
      );
    },
  );
}
