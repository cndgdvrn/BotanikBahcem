class HavaDurumuModel {
  final String name;
  var main;
  var wind;
  var weather;

  HavaDurumuModel(
      {required this.main,
      required this.name,
      required this.weather,
      required this.wind});

  factory HavaDurumuModel.fromJson(Map<String, dynamic> json) {
    return HavaDurumuModel(
      name: json['name'],
      wind: json['wind'],
      weather: json['weather'],
      main: json['main'],
    );
  }
}