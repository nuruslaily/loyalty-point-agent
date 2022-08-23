class Point {
  final int? id;
  final String name;
  final String date;
  final num total_point;
  final String no_telp;

  Point(this.id, {required this.name, required this.date, required this.total_point, required this.no_telp});
  
  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
        json['id'],
        name: json['name'],
        date: json['date'],
        total_point: json['total_point'],
        no_telp: json['no_telp']);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "total_point": total_point,
        "no_telp": no_telp
      };
}