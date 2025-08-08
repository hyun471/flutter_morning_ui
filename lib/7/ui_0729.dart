// 달력 출력
// DateTime.now()
import 'package:flutter/material.dart';

class Home0729 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    dynamic year = now.year;
    dynamic month = now.month;

    DateTime firstDay = DateTime(year, month, 1);
    DateTime lastDay = DateTime(year, month + 1, 0);

    dynamic firstDayInt = firstDay.day;
    dynamic lastDayInt = lastDay.day;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('달력')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${firstDay.month} 월',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 400,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 7,
                children: [
                  dateLabel('S', Colors.red),
                  dateLabel('M'),
                  dateLabel('T'),
                  dateLabel('W'),
                  dateLabel('T'),
                  dateLabel('F'),
                  dateLabel('S', Colors.blueAccent),
                  for (
                    int i = firstDayInt;
                    i <= lastDayInt;
                    i++
                  ) ...[dateNum(i)],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dateNum(int day) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      child: Center(
        child: Text(
          day != 0 ? '$day' : '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container dateLabel(String label, [Color? color]) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
