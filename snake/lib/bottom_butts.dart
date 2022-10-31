import 'package:flutter/material.dart';

class BottomButts extends StatelessWidget {
  final VoidCallback onPressed;
  final int score;
  final bool isButtDis;
  const BottomButts(
      {Key? key,
      required this.isButtDis,
      required this.onPressed,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 25.0,
          width: 300.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade900),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
            onPressed: (isButtDis) ? null : onPressed,
            child: const Text(
              'Start',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            color: Colors.grey.shade900,
            height: 25.0,
            width: 60.0,
            child: Center(
              child: Text(
                '$score',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
