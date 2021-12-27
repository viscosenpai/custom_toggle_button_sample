import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Toggle Button Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isModified = false;
  List<int> isSelected = [0, 0, 0, 0, 0, 0];
  List<IconData> iconList = [
    Icons.ac_unit,
    Icons.call,
    Icons.cake,
    Icons.access_alarm,
    Icons.backspace,
    Icons.calendar_today,
  ];
  List<String> labelList = [
    'label1',
    'label2',
    'label3',
    'label4',
    'label5',
    'label6',
  ];
  List<List<String>> valueList = [
    ['value1', 'value2', 'value3'],
    ['value1', 'value2', 'value3'],
    ['value1', 'value2', 'value3'],
    ['value1', 'value2', 'value3'],
    ['value1', 'value2', 'value3'],
    ['value1', 'value2', 'value3'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                height: double.infinity,
                width: double.infinity,
                child: Ink(
                  color: Colors.white,
                  child: GridView.count(
                    primary: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                    children: List.generate(iconList.length, (index) {
                      return InkWell(
                        onTap: () {
                          if (isModified) {
                            setState(() {
                              // isSelected[index] = !isSelected[index];
                              if (valueList[index].length ==
                                  ++isSelected[index]) {
                                isSelected[index] = 0;
                              }
                            });
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              color:
                                  isModified ? Colors.white : Colors.redAccent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 3,
                              )),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                valueList[index][isSelected[index]],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: isModified
                                      ? Colors.redAccent
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Icon(
                                iconList[index],
                                size: 30,
                                color: isModified
                                    ? Colors.redAccent
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isModified = !isModified;
                  print(isModified);
                });
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
