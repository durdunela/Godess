import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('სიახლეები'),
        backgroundColor: const Color(0xFFAA925C),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTopImageSection(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'საძიებო ველი - საძიებო სიტყვები',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton(context, 'ყველა'),
                _buildTabButton(context, 'სასულიერო'),
                _buildTabButton(context, 'მსოფლიო'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildListItem();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }

  Widget _buildTopImageSection() {
    return Stack(
      children: [
        Container(
          height: 150,
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
          top: 30,
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

  Widget _buildListItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: const ListTile(
          leading: Icon(Icons.image, size: 50),
          title: Text('სათაური'),
          subtitle: Text(
              'ეს არის ნიმუში ტექსტი. ეს არის მოკლე აღწერა სიახლეების განყოფილებაში.'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('16.04', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
