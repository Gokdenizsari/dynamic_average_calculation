import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:dynamic_average_calculation/widgets/show_average.dart';
import 'package:flutter/material.dart';

class CalculateAverage extends StatefulWidget {
  CalculateAverage({Key? key}) : super(key: key);

  @override
  State<CalculateAverage> createState() => _CalculateAverageState();
}

class _CalculateAverageState extends State<CalculateAverage> {
  var formKey = GlobalKey<FormState>();
  double selectedValue = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink.shade500,
        title: Center(
          child: Text(
            stabil.mainText,
            style: stabil.mainStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                //flex:1 zaten otomatik 1 alıyor. yazmaya gerek yok
                child: ShowAverage(lessonNumber: 0, average: 0),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Text("List"),
              color: Colors.red.shade400,
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            children: [
              _buildGrade(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.snowboarding_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: " ",
          border: OutlineInputBorder(borderRadius: stabil.borderRadius),
          filled: true,
          fillColor: stabil.mainColor.shade100.withOpacity(0.2)),
    );
  }

  _buildGrade() {
    return Container(
      decoration: BoxDecoration(
          color: stabil.mainColor.shade100.withOpacity(0.2),
          borderRadius: stabil.borderRadius),
      child: DropdownButton<double>(
          value: 4,
          onChanged: (deger) {
            setState(() {
              selectedValue = deger!;
            });
          },
          items: [
            DropdownMenuItem(
              child: Text("AA"),
              value: 4,
            ),
            DropdownMenuItem(
              child: Text("BA"),
              value: 3.5,
            ),
            DropdownMenuItem(
              child: Text("BB"),
              value: 3,
            ),
            DropdownMenuItem(
              child: Text("CB"),
              value: 2.5,
            ),
            DropdownMenuItem(
              child: Text("CC"),
              value: 2,
            ),
          ]),
    );
  }
}
