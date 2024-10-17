import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TelevisionPage extends StatelessWidget {
  const TelevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopImageSection(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'საძიებო ველი - გადაცემის მიხედვით',
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
                _buildTabButton(context, 'რჩეული გადაცემები'),
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
              height: 100,
              child: SvgPicture.asset('lib/assets/logo.svg'),
            ),
          ),
        ),
      ],
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

  Widget _buildListItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: const ListTile(
          title: Text('სათაური'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
