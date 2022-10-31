import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snake/MyGrid.dart';
import 'bottom_butts.dart';

void main() {
  runApp(const MaterialApp(
    home: MyGame(),
  ));
}

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  List<int> snakePos = [10, 30, 50];
  String direction = 'down';
  int appleIndex = -1;
  int score = 3;
  bool isStartButtDis = false;

  void spawnApple() {
    do {
      appleIndex = Random().nextInt(700);
    } while (snakePos.contains(appleIndex));
  }

  void start() {
    isStartButtDis = true;
    //print('start');
    spawnApple();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      updateSnake();
      if (isCollision()) {
        timer.cancel();
        restart();
      }
    });
  }

  void restart() {
    isStartButtDis = false;
    snakePos = [10, 30, 50];
    score = 3;
    direction = 'down';
  }

  bool isCollision() {
    return (snakePos.indexOf(snakePos.last) == snakePos.length - 1)
        ? false
        : true;
  }

  void updateSnake() {
    setState(() {
      bool isApple = false;
      if (snakePos.last == appleIndex) {
        isApple = true;
        score++;
        spawnApple();
      }
      switch (direction) {
        case 'down':
          if (snakePos.last > 680) {
            snakePos.add(snakePos.last + 20 - 700);
          } else {
            snakePos.add(snakePos.last + 20);
          }
          if (!isApple) {
            snakePos.removeAt(0);
          } else {
            isApple = false;
          }
          break;
        case 'up':
          if (snakePos.last < 20) {
            snakePos.add(snakePos.last + 700 - 20);
          } else {
            snakePos.add(snakePos.last - 20);
          }
          if (!isApple) {
            snakePos.removeAt(0);
          } else {
            isApple = false;
          }
          break;
        case 'left':
          if (snakePos.last % 20 == 0) {
            snakePos.add(snakePos.last + 20 - 1);
          } else {
            snakePos.add(snakePos.last - 1);
          }
          if (!isApple) {
            snakePos.removeAt(0);
          } else {
            isApple = false;
          }
          break;
        case 'right':
          if ((snakePos.last - 19) % 20 == 0) {
            snakePos.add(snakePos.last - 20 + 1);
          } else {
            snakePos.add(snakePos.last + 1);
          }
          if (!isApple) {
            snakePos.removeAt(0);
          } else {
            isApple = false;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (direction != 'up' && details.delta.dy > 0) {
                    direction = 'down';
                  } else if (direction != 'down' && details.delta.dy < 0) {
                    direction = 'up';
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (direction != 'left' && details.delta.dx > 0) {
                    direction = 'right';
                  } else if (direction != 'right' && details.delta.dx < 0) {
                    direction = 'left';
                  }
                },
                child: MyGrid(
                  snakePos: snakePos,
                  appleIndex: appleIndex,
                ),
              ),
            ),
            BottomButts(
              isButtDis: isStartButtDis,
              onPressed: start,
              score: score,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
