import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:dynamic_average_calculation/helper/data_helper.dart';
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
  double selectedCredit = 1;
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
          Padding(
            padding: stabil.horizontalPadding,
            child: _buildTextFormField(),
          ),
          Row(
            children: [
              Expanded(child: Padding(padding: stabil.horizontalPadding,
              child: _buildGrade(),
              ),
              ),
              Expanded(child: Padding(padding: stabil.horizontalPadding,
              child: _buildCredit(),
              ),
              ),
              
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_rounded),
                color: stabil.mainColor,
                iconSize: 25,
              ),
            ],
          ),
          SizedBox(height: 4,),
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
      padding: stabil.dropDownPadding,
      decoration: BoxDecoration(
          color: stabil.mainColor.shade100.withOpacity(0.2),
          borderRadius: stabil.borderRadius),
      child: DropdownButton<double>(
        value: selectedValue,
        elevation: 16,
        iconEnabledColor: stabil.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
            print(value);
          });
        },
        underline: Container(),
        items: DataHelper.allLectureNotes(),
      ),
    );
  }

  _buildCredit() {
    return Container(
      padding: stabil.dropDownPadding,
      decoration: BoxDecoration(
          color: stabil.mainColor.shade100.withOpacity(0.2),
          borderRadius: stabil.borderRadius),
      child: DropdownButton<double>(
        value: selectedCredit,
        elevation: 16,
        iconEnabledColor: stabil.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
            print(value);
          });
        },
        underline: Container(),
        items: DataHelper.allLessonCredit(),
      ),
    );
  }
}
