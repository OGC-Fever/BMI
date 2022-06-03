
import 'package:bmi/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:bmi/pages/home/home.dart';

late final ObjectBox objectbox;
final recData = objectbox.store.box<Record>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  runApp(const Hello());
}

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

@Entity()
class Record {
  int id = 0;
  double height;
  double weight;
  double bmi;
  String note;
  String date;
  int color;
  Record(
      {required this.height,
      required this.weight,
      required this.bmi,
      required this.note,
      required this.date,
      required this.color});
}

class ObjectBox {
  late final Store store;
  ObjectBox._create(this.store);
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
