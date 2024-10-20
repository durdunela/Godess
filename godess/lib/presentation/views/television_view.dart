import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godess/models/shows.dart';
import 'package:godess/presentation/views/video_list.dart';
import 'package:godess/services/config.dart';

class TelevisionPage extends StatelessWidget {
  const TelevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

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
            child: FutureBuilder<List<Show>>(
              future: apiService.fetchChannels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No channels found'));
                }

                final channels = snapshot.data!;

                return ListView.builder(
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(context, channels[index]);
                  },
                );
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

  Widget _buildListItem(BuildContext context, Show show) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                show.imageUrl ?? 'No image',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(show.title ?? 'No Title'),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoListScreen(show: show),
              ),
            );
          },
        ),
      ),
    );
  }
}
