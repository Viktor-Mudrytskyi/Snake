import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({required this.snakePos, required this.appleIndex, Key? key})
      : super(key: key);

  final int gridCount = 700;
  final List<int> snakePos;
  final int appleIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 20,
      ),
      itemCount: 700,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (snakePos.contains(index)) {
          return Container(
            padding: const EdgeInsets.all(1.5),
            color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                color: Colors.white,
              ),
            ),
          );
        } else if (index == appleIndex) {
          return Container(
            padding: const EdgeInsets.all(1.5),
            color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                color: Colors.amber,
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(1.5),
            color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                color: Colors.grey.shade900,
              ),
            ),
          );
        }
      },
    );
  }
}
