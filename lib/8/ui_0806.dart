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
              dateWidget(days: days),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return TODOBox(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dateWidget extends StatelessWidget {
  const dateWidget({super.key, required this.days});

  final List<String> days;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
            children: [
              dateBox(date: 'Mon', dateNum: days[index]),
              dateBox(date: 'Tue', dateNum: days[index]),
              dateBox(date: 'Wed', dateNum: days[index]),
              dateBox(date: 'Thu', dateNum: days[index]),
              dateBox(date: 'Fri', dateNum: days[index]),
              dateBox(date: 'Sat', dateNum: days[index]),
              dateBox(date: 'Sun', dateNum: days[index]),
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
    );
  }
}

class TODOBox extends StatelessWidget {
  int index;
  TODOBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String subTitle = '';
    String time = '';
    Color? boxColor;
    Color? titleColor;
    Color? subtitleColor;

    switch (index) {
      case 0:
        title = 'Wakeup';
        subTitle = 'Early wakeup from bed and fresh';
        time = '7:00 Am';
        boxColor = Colors.grey[200];
        titleColor = Colors.black;
        subtitleColor = Colors.grey;
      case 1:
        title = 'Mornign Exercise';
        subTitle = '4 types of exercise';
        time = '8:00 Am';
        boxColor = Colors.grey[200];
        titleColor = Colors.black;
        subtitleColor = Colors.grey;
      case 2:
        title = 'Meeting';
        subTitle = 'Zoom call, Discuss team task for the day';
        time = '9:00 Am';
        boxColor = Colors.blueAccent;
        titleColor = Colors.white;
        subtitleColor = Colors.white;
      case 3:
        title = 'Breakfast';
        subTitle =
            'Morning breakfast with bread, banana egg bowel and tea';
        time = '10:00 Am';
        boxColor = Colors.grey[200];
        titleColor = Colors.black;
        subtitleColor = Colors.grey;
    }
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                index == 2
                    ? Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                      )
                    : Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                      ),
                SizedBox(height: 5),
                index == 3
                    ? SizedBox.shrink()
                    : Expanded(
                        child: Container(
                          width: 2,
                          color: Colors.blueAccent,
                        ),
                      ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 80),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: titleColor,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 16,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: subtitleColor,
                      ),
                    ),
                    index == 2
                        ? Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 40,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.ac_unit_rounded,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
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
