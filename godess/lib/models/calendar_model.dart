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
        image: 'lib/assets/image.png',
        title: 'წმ. კონსტანტინე',
      ),
      Event(
        date: '20.04',
        image: 'lib/assets/image.png',
        title: 'დიდი ხუთშაბათი',
      ),
      Event(
        date: '21.04',
        image: 'lib/assets/image.png',
        title: 'წმ. ბარბარე',
      ),
      Event(
        date: '22.04',
        image: 'lib/assets/image.png',
        title: 'მოწამე კირიაკი',
      ),
    ];
  }
}
