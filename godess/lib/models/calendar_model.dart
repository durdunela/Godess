class Event {
  final String date;
  final String image;
  final String title;

  Event({
    required this.date,
    required this.image,
    required this.title,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: json['date'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'image': image,
      'title': title,
    };
  }
}
