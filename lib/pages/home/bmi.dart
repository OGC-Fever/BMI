import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi/main.dart';

class BMI extends StatefulWidget {
  const BMI({
    Key? key,
  }) : super(key: key);

  @override
  BMIState createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  final heightCtrler = TextEditingController();
  final weightCtrler = TextEditingController();
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;
  String _status = "";
  String _note = "";
  Color _color = Colors.transparent;
  final Color _divColor = Colors.blue;
  var heightFocusNode = FocusNode();
  var weightFocusNode = FocusNode();
  void calc() {
    FocusScope.of(context).unfocus();
    try {
      _height = double.parse(heightCtrler.text);
      _weight = double.parse(weightCtrler.text);
      _bmi = double.parse((_weight / pow(_height / 100, 2)).toStringAsFixed(1));
      if (_height <= 0 || _weight <= 0 || _bmi <= 0) {
        throw Exception();
      } else {
        setState(() {
          _status = _bmi.toString();
          _color = Theme.of(context).colorScheme.onPrimary;

          if (_bmi < 18.5) {
            _note = "太瘦了";
            _color = Colors.orange;
          } else if (_bmi < 24) {
            _note = "體重正常";
            _color = Colors.green;
          } else if (_bmi < 27) {
            _note = "體重過重";
            _color = Colors.orange;
          } else if (_bmi < 30) {
            _note = "輕度肥胖";
            _color = Colors.red.shade300;
          } else if (_bmi < 35) {
            _note = "中度肥胖";
            _color = Colors.red.shade600;
          } else {
            _note = "重度肥胖";
            _color = Colors.red.shade900;
          }
          recData.put(Record(
              height: _height,
              weight: _weight,
              bmi: _bmi,
              note: _note,
              datetime: DateTime.now(),
              color: _color.value));
        });
      }
    } catch (e) {
      setState(() {
        _status = "Input Error";
        _note = "";
        _color = Theme.of(context).colorScheme.error;
      });
    }
  }

  void clean() {
    FocusScope.of(context).unfocus();
    setState(() {
      heightCtrler.text = "";
      weightCtrler.text = "";
      _height = 0;
      _weight = 0;
      _bmi = 0;
      _status = "";
      _note = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        inputField(10, "身高 :", 20, heightCtrler, "cm", heightFocusNode),
        inputField(10, "體重 :", 20, weightCtrler, "kg", weightFocusNode),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              actBtn(2, () => calc(), "計算", Colors.blue, 20, 20, 10),
              actBtn(2, () => clean(), "清除", Colors.red, 20, 20, 10),
            ],
          ),
        ),
        divLine(10, _divColor, 2),
        msg(10, "BMI:", _status, 20, _color),
        divLine(10, _divColor, 2),
        msg(10, "Note:", _note, 20, _color),
      ],
    );
  }
}

Widget inputField(double padding, String text, double fontSize,
    TextEditingController ctrl, String label, FocusNode focusNode) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            focusNode: focusNode,
            controller: ctrl,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                suffix: GestureDetector(
                  child: const Icon(Icons.clear),
                  onTap: () {
                    focusNode.requestFocus();
                    ctrl.clear();
                  },
                ),
                border: const OutlineInputBorder(),
                labelText: label),
          ),
        ),
      ],
    ),
  );
}

Widget actBtn(double padding, Function() func, String text, Color color,
    double fontSize, double btnPadding, double radius) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ElevatedButton(
        onPressed: func,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(btnPadding),
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
      ),
    ),
  );
}

Widget divLine(double padding, Color color, double thickness) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Divider(
      color: color,
      thickness: thickness,
    ),
  );
}

Widget msg(
    double padding, String text, String msg, double fontSize, Color color) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            msg,
            style: TextStyle(fontSize: fontSize, color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
