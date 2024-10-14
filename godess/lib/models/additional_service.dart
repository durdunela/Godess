import 'package:flutter/material.dart';
import 'package:godess/presentation/views/goods_view.dart';
import 'package:godess/presentation/views/map_view.dart';

class AdditionalService {
  final String name;
  final String imagePath;
  final Widget page;

  AdditionalService({
    required this.name,
    required this.imagePath,
    required this.page,
  });

  static List<AdditionalService> getServices() {
    List<AdditionalService> services = [];

    services.add(
      AdditionalService(
        name: 'სამონასტრო ნაწარმის ონლაინ შესყიდვა',
        imagePath: 'assets/service.svg',
        page: const GoodsPage(),
      ),
    );

    services.add(
      AdditionalService(
        name: 'საეკლესიო სამონასტრო რუქა',
        imagePath: 'assets/map.svg',
        page: const ChurchMap(),
      ),
    );

    return services;
  }
}
