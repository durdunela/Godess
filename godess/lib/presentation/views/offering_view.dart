import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfferingPage extends StatelessWidget {
  const OfferingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAA925C),
        title: const Text('შესაწირი'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopImageSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ერთად დავეხმაროთ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  _buildGridButtons(),

                  const SizedBox(height: 20),

                  const Text(
                    'გაიღე მცირედი მოწყალება',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Cards
                  _buildCard(
                    'გადაუდებელი დახმარება',
                    'description.',
                    Icons.image,
                  ),
                  const SizedBox(height: 10),
                  _buildCard(
                    'შემწეობა უპოვრებისთვის',
                    'description.',
                    Icons.image,
                  ),
                  const SizedBox(height: 10),
                  _buildCard(
                    'შემწეობა მოხუცთა თავშესაფარს',
                    'description.',
                    Icons.image,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopImageSection() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'http://fortis.ge/wp-content/uploads/2020/05/poto2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset('lib/assets/logo.svg'),
              height: 100,
            ),
          ),
        ),
      ],
    );
  }

  // Grid Buttons
// Grid Buttons
  Widget _buildGridButtons() {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGridButton('მოხუცთა თავშესაფარს'),
        _buildGridButton('მზრუნველობა მოკლებულ ბავშვებს'),
        _buildGridButton('მრავალშვილიან ოჯახებს'),
        _buildGridButton('უპოვარი და ღატაკი ადამიანებს'),
        _buildGridButton(
            'ჯანმრთელობის პრობლემისა და გადაუდებელი საჭიროების მქონდე ადამიანებს'),
      ],
    );
  }

  // Grid Button
  Widget _buildGridButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.black),
        padding: const EdgeInsets.all(16),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }

  // Card Widget
  Widget _buildCard(String title, String description, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}
