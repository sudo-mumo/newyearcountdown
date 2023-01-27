import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({
    super.key,
    required this.timeValue,
    required this.timeDescription,
  });

  final int timeValue;
  final String timeDescription;
  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // height: 150,
      // width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              widget.timeValue.toString(),
              style: TextStyle(
                fontSize: size.width * 0.075,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              widget.timeDescription,
              style: TextStyle(
                fontSize: size.width * 0.02,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
