class Lesson {
  final String id;
  final double letterValue;
  final double creditValue;

  Lesson(
      {required this.id, required this.letterValue, required this.creditValue});

  @override
  String toString() {
    return "$id" "$letterValue" "$creditValue";
  }
}
