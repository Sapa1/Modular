class TempDetail {
  final String date;
  final String weekDay;
  final String max;
  final String min;
  final String description;
  final String condition;

  TempDetail({
    required this.date,
    required this.weekDay,
    required this.max,
    required this.min,
    required this.description,
    required this.condition,
  });

  factory TempDetail.fromJson(Map<String, dynamic> json) {
    return TempDetail(
      date: json['date'],
      weekDay: json['weekDay'],
      max: json['max'],
      min: json['min'],
      description: json['description'],
      condition: json['condition'],
    );
  }
}
