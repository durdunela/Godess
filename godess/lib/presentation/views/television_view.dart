import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godess/data/Providers/state_provider.dart';
import 'package:godess/models/shows.dart';
import 'package:godess/presentation/views/video_list.dart';

class TelevisionPage extends ConsumerWidget {
  TelevisionPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showsAsyncValue = ref.watch(showProvider);

    return Scaffold(
      body: Column(
        children: [
          _buildTopImageSection(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'საძიებო ველი - გადაცემის მიხედვით',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                ref.read(showProvider.notifier).filterShows(query);
              },
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
            child: showsAsyncValue.when(
              data: (shows) {
                if (shows.isEmpty) {
                  return const Center(child: Text('No channels found'));
                }

                return ListView.builder(
                  itemCount: shows.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(context, shows[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
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
