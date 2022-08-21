import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _allLectureNotes() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _numberEquivalentOfNotes(String character) {
    switch (character) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLectureNotes() {
    return _allLectureNotes()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _numberEquivalentOfNotes(e),
          ),
        )
        .toList();
  }

  static List<int> _allLessonCredit() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allLessonCredit() {
    return _allLessonCredit()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
