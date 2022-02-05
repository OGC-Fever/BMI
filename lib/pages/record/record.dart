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
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Records"),
        ),
        body: recData.count() > 0 ? recordList() : nullList());
  }

  void delRec(id) {
    recData.remove(id);
    setState(() {});
  }

  String removeTail(input) {
    return input.contains(".0") ? input.split(".")[0] : input;
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
          return GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('Delete?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            delRec(recData.getAll()[index].id);
                          },
                          child: const Text("Yes"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No.${(index + 1)}",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recData.getAll()[index].date,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "height",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            removeTail(
                                recData.getAll()[index].height.toString()),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "BMI",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            removeTail(recData.getAll()[index].bmi.toString()),
                            style: TextStyle(
                                color: Color(recData.getAll()[index].color),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "weight",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            removeTail(
                                recData.getAll()[index].weight.toString()),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "note",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recData.getAll()[index].note.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(recData.getAll()[index].color)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          );
        });
  }
}
