import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonNumber;

  const ShowAverage(
      {required this.lessonNumber, required this.average, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonNumber > 0 ? "$lessonNumber Lesson Entered" : "Choose Lesson",
          style: stabil.lessonStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: stabil.averageStyle,
        ),
        Text(
          "Average",
          style: stabil.averageStyle2,
        ),
      ],
    );
  }
}
