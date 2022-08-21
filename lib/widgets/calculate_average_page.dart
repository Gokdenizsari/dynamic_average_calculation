import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:dynamic_average_calculation/helper/data_helper.dart';
import 'package:dynamic_average_calculation/model/lesson.dart';
import 'package:dynamic_average_calculation/widgets/show_average.dart';
import 'package:flutter/material.dart';

class CalculateAverage extends StatefulWidget {
  CalculateAverage({Key? key}) : super(key: key);

  @override
  State<CalculateAverage> createState() => _CalculateAverageState();
}

class _CalculateAverageState extends State<CalculateAverage> {
  var formKey = GlobalKey<FormState>();
  double selected = 1;
  double credi = 1;
  double selectedValue = 4;
  double selectedCredit = 1;
  String selectedLessonName = "";
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
                child: ShowAverage(
                    lessonNumber: DataHelper.allAddLesson.length,
                    average: DataHelper.calculateAverage()),
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
              Expanded(
                child: Padding(
                  padding: stabil.horizontalPadding,
                  child: _buildGrade(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: stabil.horizontalPadding,
                  child: _buildCredit(),
                ),
              ),
              IconButton(
                onPressed: _addLessonAndCalculateAverage,
                icon: Icon(Icons.arrow_back_ios_sharp),
                color: stabil.mainColor,
                iconSize: 25,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        selectedLessonName = value!;
      },
      validator: (g) {
        if (g!.length <= 0) {
          return 'Please Enter The Lesson Name';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Criminal Law',
          border: OutlineInputBorder(
            borderRadius: stabil.borderRadius,
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: stabil.mainColor.shade100.withOpacity(0.3)),
    );
  }

  Widget _buildGrade() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: stabil.mainColor.shade100.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<double>(
        iconEnabledColor: stabil.mainColor.shade200,
        elevation: 16,
        items: DataHelper.allLectureNotes(),
        underline: Container(),
        onChanged: (BA) {
          setState(() {
            selected = BA!;
            print(BA);
          });
        },
        value: selected,
      ),
    );
  }

  _buildCredit() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: stabil.mainColor.shade100.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<double>(
        iconEnabledColor: stabil.mainColor.shade200,
        elevation: 16,
        items: DataHelper.allLessonCredit(),
        underline: Container(),
        onChanged: (AA) {
          setState(() {
            credi = AA!;
            print(AA);
          });
        },
        value: credi,
      ),
    );
  }

  /* return Container(
      padding: stabil.dropDownPadding,
      decoration: BoxDecoration(
          color: stabil.mainColor.shade100.withOpacity(0.2),
          borderRadius: stabil.borderRadius),
      child: DropdownButton<double>(
        value: selectedCredit,
        elevation: 16,
        iconEnabledColor: stabil.mainColor.shade200,
        onChanged: (value2) {
          setState(() {
            selectedValue = value2!;
          });
        },
        underline: Container(),
        items: DataHelper.allLessonCredit(),
      ),
    );
  }*/

  void _addLessonAndCalculateAverage() {
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      var addLesson = Lesson(
          id: selectedLessonName,
          letterValue: selectedValue,
          creditValue: selectedCredit);
      DataHelper.addLesson(addLesson);
      setState(() {});
    }
  }
}
