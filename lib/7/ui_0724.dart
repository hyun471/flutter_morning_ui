import 'package:flutter/material.dart';

Map<String, String> data = {
  '1': ' ',
  '2': 'A B C',
  '3': 'D E F',
  '4': 'G H I',
  '5': 'J K L',
  '6': 'M N O',
  '7': 'P Q R S',
  '8': 'T U V',
  '9': 'W X Y Z',
  '*': '',
  '0': '',
  '#': '',
};

class MyHome0724 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newdata = data.entries.toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data'),
            Text('data'),
            Spacer(),
            numKeyRow(newdata[0], newdata[1], newdata[2]),
            numKeyRow(newdata[3], newdata[4], newdata[5]),
            numKeyRow(newdata[6], newdata[7], newdata[8]),
            numKeyRow(newdata[9], newdata[10], newdata[11]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(height: 80, width: 80),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: callBox(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(height: 80, width: 80),
                ),
              ],
            ),

            SafeArea(child: SizedBox(height: 60)),
          ],
        ),
      ),
    );
  }

  Row numKeyRow(
    MapEntry<String, String> newdata1,
    MapEntry<String, String> newdata2,
    MapEntry<String, String> newdata3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: numKey(newdata1),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: numKey(newdata2),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: numKey(newdata3),
        ),
      ],
    );
  }

  Container numKey(MapEntry<String, String> data) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.key,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (data.value != '') ...[
            Text(
              data.value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ] else if (data.key == '0') ...[
            Icon(Icons.add, size: 20),
          ],
        ],
      ),
    );
  }

  Container callBox() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 45, 212, 51),
      ),
      child: Icon(Icons.call, size: 34, color: Colors.white),
    );
  }
}
