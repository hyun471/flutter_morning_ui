import 'package:flutter/material.dart';

class MyHome0806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    DateTime beginDate = DateTime(date.year, date.month, 1);
    DateTime endDate = DateTime(date.year, date.month + 1, -1);
    print(date.weekday);
    List<String> days = [];
    for (var i = 0; i < date.weekday; i++) {
      days.add('');
    }
    for (var i = 1; i <= endDate.day; i++) {
      days.add('$i');
    }
    while (days.length % 7 != 0) {
      days.add('');
    }
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${date.year}년, ${date.month}월',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: PageView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        dateBox(
                          date: 'Mon',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Tue',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Wed',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Thu',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Fri',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Sat',
                          dateNum: days[index],
                        ),
                        dateBox(
                          date: 'Sun',
                          dateNum: days[index],
                        ),
                      ],
                    );
                    // Row(
                    //   children: [
                    //     dateBox(date: 'Mon', dateNum: '11'),
                    //     dateBox(date: 'Tue', dateNum: '12'),
                    //     dateBox(date: 'Wed', dateNum: '13'),
                    //     dateBox(date: 'Thu', dateNum: '14'),
                    //     dateBox(date: 'Fri', dateNum: '15'),
                    //     dateBox(date: 'Sat', dateNum: '16'),
                    //     dateBox(date: 'Sun', dateNum: '17'),
                    //   ],
                    // ),
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [Container(), Container()]),
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 80,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Wakeup'),
                                Text('7:00 AM'),
                              ],
                            ),
                            Text(
                              'Early wakeup from bed and fresh',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dateBox extends StatelessWidget {
  String date;
  String dateNum;
  dateBox({
    required this.date,
    required this.dateNum,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
            Text(
              dateNum,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
