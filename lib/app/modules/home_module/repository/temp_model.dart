import 'dart:convert';

class TempModel {
  final DateTime date;
  final double temp;
  final String city;
  TempModel({
    required this.date,
    required this.temp,
    required this.city,
  });

  TempModel copyWith({
    DateTime? date,
    double? temp,
    String? city,
  }) {
    return TempModel(
      date: date ?? this.date,
      temp: temp ?? this.temp,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'temp': temp,
      'city': city,
    };
  }

  factory TempModel.fromMap(Map<String, dynamic> map) {
    return TempModel(
      date: DateTime.parse(map['results']['date']),
      temp: (map['results']['temp'] as int).toDouble(),
      city: map['results']['city'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TempModel.fromJson(String source) =>
      TempModel.fromMap(json.decode(source));

  @override
  String toString() => 'TempModel(date: $date, temp: $temp, city: $city)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TempModel &&
        other.date == date &&
        other.temp == temp &&
        other.city == city;
  }

  @override
  int get hashCode => date.hashCode ^ temp.hashCode ^ city.hashCode;
}
