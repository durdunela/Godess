import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/models/products_model.dart';

class GoodsPage extends ConsumerWidget {
  const GoodsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar with cart icon
            Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                children: [
                  // Shrinking search bar
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.11),
                          blurRadius: 40,
                          spreadRadius: 0.0,
                        ),
                      ]),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'ნაწარმის სახელით და კატეგორიით ძიება',
                          hintStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 14),
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.filter_alt),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Cart icon
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Milk Products Section
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'რძის პროდუქტი',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: MilkProduct.getProducts().map(
                  (product) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            product.imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Drinks Section
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'სასმელი',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Drinks.getDrinks().map(
                  (drink) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            drink.imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Necklaces Section
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'ყელსაბამი',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Necklace.getNecklace().map(
                  (necklace) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            necklace.imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
