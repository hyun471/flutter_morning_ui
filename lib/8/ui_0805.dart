import 'package:flutter/material.dart';

class MyHome0805 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('막대 그래프')),
      body: Container(
        width: double.infinity,
        height: 400,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minggunan',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Grafik konsumsi kalori',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Box(
                      color: Colors.deepOrangeAccent,
                      hight: 100,
                      days: 'M',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.blueGrey,
                      hight: 80,
                      days: 'T',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.brown,
                      hight: 80,
                      days: 'W',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.deepPurpleAccent,
                      hight: 120,
                      days: 'T',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.yellowAccent,
                      hight: 150,
                      days: 'F',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.pinkAccent,
                      hight: 90,
                      days: 'S',
                    ),
                  ),
                  Expanded(
                    child: Box(
                      color: Colors.purpleAccent,
                      hight: 70,
                      days: 'S',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  Color color;
  double hight;
  String days;
  Box({
    required this.color,
    required this.hight,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 25,
                height: hight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Text(
          days,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
