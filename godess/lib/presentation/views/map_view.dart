import 'package:flutter/material.dart';
import 'package:godess/widgets/custom_appbar.dart';

class ChurchMap extends StatelessWidget {
  const ChurchMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'საეკლესიო რუქა',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.filter_alt),
                hintText: 'ელექსია-მონასტრების არჩევა',
              ),
              items: ['ეკლესია 1', 'ეკლესია 2', 'ეკლესია 3']
                  .map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.place),
                      title: const Text(
                        'ეკლესია',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'test...',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 230,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(
                    'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_1920,c_limit/GoogleMapTA.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Icon(
                  Icons.location_pin,
                  size: 60,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
