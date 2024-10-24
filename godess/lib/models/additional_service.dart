class AdditionalService {
  final String name;
  final String imagePath;

  AdditionalService({
    required this.name,
    required this.imagePath,
  });

  static List<AdditionalService> getServices() {
    List<AdditionalService> services = [];

    services.add(
      AdditionalService(
        name: 'საკითხაავი და მოსასმენი ლოცვები',
        imagePath: 'lib/assets/prayers.svg',
      ),
    );

    services.add(
      AdditionalService(
        name: 'საეკლესიო სამონასტრო რუქა',
        imagePath: 'lib/assets/map.svg',
      ),
    );

    return services;
  }
}
