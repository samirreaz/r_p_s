import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Random random = Random();
  int machineGeneratedIndex = 0;
  int yourSelection = 0;
  String result = 'No Result';
  _randomGenerator() {
    machineGeneratedIndex = random.nextInt(3);
  }

  List<String> images = [
    'assets/images/r.png',
    'assets/images/p.png',
    'assets/images/s.png',
  ];

  winnerCheck() {
    if ((machineGeneratedIndex == 0 && yourSelection == 0) ||
        (machineGeneratedIndex == 1 && yourSelection == 1) ||
        (machineGeneratedIndex == 2 && yourSelection == 2)) {
      result = 'No Winner';
    } else if (machineGeneratedIndex == 0 && yourSelection == 1) {
      result == 'Your Win';
    } else if (machineGeneratedIndex == 0 && yourSelection == 2) {
      result = 'You Lose';
    } else if (machineGeneratedIndex == 1 && yourSelection == 2) {
      result = 'You Win';
    } else if (machineGeneratedIndex == 1 && yourSelection == 0) {
      result = 'You Lose';
    } else if (machineGeneratedIndex == 2 && yourSelection == 0) {
      result = 'You Win';
    } else if (machineGeneratedIndex == 2 && yourSelection == 1) {
      result = 'You Lose';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text('Your'),
                    Image(
                      image: AssetImage(images[yourSelection]),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Text('Machine'),
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage(images[machineGeneratedIndex]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    yourSelection = 0;
                    _randomGenerator();
                    winnerCheck();
                    print(machineGeneratedIndex);
                  });
                },
                child: Text('Rock'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    yourSelection = 1;
                    _randomGenerator();
                    winnerCheck();
                    print(machineGeneratedIndex);
                  });
                },
                child: Text('Paper'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    yourSelection = 2;
                    _randomGenerator();
                    winnerCheck();
                    print(machineGeneratedIndex);
                  });
                },
                child: Text('Scissors'),
              ),
            ],
          ),
          Text(
            result,
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
