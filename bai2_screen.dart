import 'package:flutter/material.dart';

class Bai2Screen extends StatelessWidget {
  const Bai2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final places = [
      {
        'name': 'Đại Nội Huế',
        'image':
            'https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=400'
      },
      {
        'name': 'Cầu Trường Tiền',
        'image':
            'https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?w=400'
      },
      {
        'name': 'Thảo Cầm Viên',
        'image':
            'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=400'
      },
      {
        'name': 'Ga Huế',
        'image':
            'https://images.unsplash.com/photo-1474564862106-1f23d10b9d72?w=400'
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Welcome,',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w300)),
                Row(
                  children: [
                    IconButton(
                        icon:
                            const Icon(Icons.notifications_outlined, size: 28),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.grid_view, size: 28),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
            const Text('Anh Ca',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Saved Places',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return InkWell(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Đã chọn: ${place['name']}'),
                          duration: const Duration(seconds: 1))),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(place['image'] as String),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7)
                          ],
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(12),
                      child: Text(place['name'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
