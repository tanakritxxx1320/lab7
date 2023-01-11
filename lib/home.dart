import 'package:flutter/material.dart';
import 'package:lab7/secondpage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController weight = TextEditingController();
  TextEditingController hight = TextEditingController();
  String groupsex = "Sex1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("วิเคราะห์ค่า BMI"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            RadioListTile(
              title: Text("เพศชาย"),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'Sex1',
              groupValue: groupsex,
              onChanged: (value) {
                setState(() {
                  groupsex = value!;
                });
                print(groupsex);
              },
            ),
            RadioListTile(
              title: Text("เพศหญิง"),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'Sex2',
              groupValue: groupsex,
              onChanged: (value) {
                setState(() {
                  groupsex = value!;
                });
                print(groupsex);
              },
            ),
            RadioListTile(
              title: Text("เพศทางเลือก"),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'Sex3',
              groupValue: groupsex,
              onChanged: (value) {
                setState(() {
                  groupsex = value!;
                });
                print(groupsex);
              },
            ),
            Text("น้ำหนัก"),
            TextFormField(
              controller: weight,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'จงใส่น้ำหนัก';
                }
                return null;
              },
            ),
            Text("ส่วนสูง"),
            TextFormField(
              controller: hight,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'จงใส่ส่วนสูง';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  print(weight.text);
                  print(hight.text);

                  double _bmi = 0.0;

                  setState(() {
                    var _heightM = double.parse(weight.text) / 100;
                    _bmi = double.parse(hight.text) / (_heightM * _heightM);
                  });
                  print(_bmi);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            SecondPage(bmi: _bmi, weight: weight.text, hight: hight.text)),
                      ));
                }
              },
              child: Text("คำนวณ"),
            )
          ],
        ),
      ),
    );
  }
}
