class MilkProduct {
  final String imagePath;

  MilkProduct({
    required this.imagePath,
  });

  static List<MilkProduct> getProducts() {
    return [
      MilkProduct(imagePath: 'lib/assets/milk.png'),
      MilkProduct(imagePath: 'lib/assets/milk.png'),
      MilkProduct(imagePath: 'lib/assets/milk.png'),
      MilkProduct(imagePath: 'lib/assets/milk.png'),
    ];
  }
}

class Drinks {
  final String imagePath;

  Drinks({
    required this.imagePath,
  });

  static List<Drinks> getDrinks() {
    return [
      Drinks(imagePath: 'lib/assets/wine.png'),
      Drinks(imagePath: 'lib/assets/wine.png'),
      Drinks(imagePath: 'lib/assets/wine.png'),
      Drinks(imagePath: 'lib/assets/wine.png'),
    ];
  }
}

class Necklace {
  final String imagePath;

  Necklace({
    required this.imagePath,
  });

  static List<Necklace> getNecklace() {
    return [
      Necklace(imagePath: 'lib/assets/necklace.png'),
      Necklace(imagePath: 'lib/assets/necklace.png'),
      Necklace(imagePath: 'lib/assets/necklace.png'),
      Necklace(imagePath: 'lib/assets/necklace.png'),
    ];
  }
}
