import 'package:dynamic_average_calculation/constants/app_constants.dart';
import 'package:dynamic_average_calculation/helper/data_helper.dart';
import 'package:dynamic_average_calculation/model/lesson.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;

  const LessonList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLesson = DataHelper.allAddLesson;

    return allLesson.length > 0
        ? ListView.builder(
            itemCount: allLesson.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (c) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLesson[index].id),
                      leading: CircleAvatar(
                        backgroundColor: stabil.mainColor,
                        child: Text(
                          (allLesson[index].letterValue *
                                  allLesson[index].creditValue)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${allLesson[index].creditValue} Credit, Not Value ${allLesson[index].letterValue}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Please enter a lesson",
              style: stabil.mainStyle,
            )),
          );
  }
}
