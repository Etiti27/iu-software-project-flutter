class Year {
  DateTime now = DateTime.now();
  late int current;
  Year() {
    current = now.year;
  }
  int getYear() {
    return now.year;
  }
}
