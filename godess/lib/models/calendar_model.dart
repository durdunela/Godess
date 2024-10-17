class Event {
  final String date;
  final String image;
  final String title;

  Event({
    required this.date,
    required this.image,
    required this.title,
  });

  static List<Event> getEvent() {
    return [
      Event(
        date: '19.04',
        image: 'lib/assets/image1.png',
        title: 'წინადაცვეთა უფლისა ჩვენისა იესუ ქრისტესი',
      ),
      Event(
        date: '20.04',
        image: 'lib/assets/image2.png',
        title: 'წინადაცვეთა უფლისა ჩვენისა იესუ ქრისტესი',
      ),
      Event(
        date: '21.04',
        image: 'lib/assets/image3.png',
        title: 'წინადაცვეთა უფლისა ჩვენისა იესუ ქრისტესი',
      ),
      Event(
        date: '22.04',
        image: 'lib/assets/image4.png',
        title: 'წინადაცვეთა უფლისა ჩვენისა იესუ ქრისტესი',
      ),
    ];
  }
}
