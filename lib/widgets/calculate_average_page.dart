import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CalculateAverage extends StatefulWidget {
  CalculateAverage({Key? key}) : super(key: key);

  @override
  State<CalculateAverage> createState() => _CalculateAverageState();
}

class _CalculateAverageState extends State<CalculateAverage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink.shade500,
        title: Center(child: Text(stabil.mainText,style: stabil.mainStyle,),
        ),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}