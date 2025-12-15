import 'package:flutter/material.dart';

class Bai3Screen extends StatelessWidget {
  const Bai3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'name': 'aNhill Boutique',
        'rating': 9.5,
        'reviews': 'Xuất sắc • 95 đánh giá',
        'location': 'Huế • Cách bạn 0,6km',
        'room': '1 suite riêng tư: 1 giường',
        'price': 'US\$109',
        'image':
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
        'tag': 'Bao bữa sáng'
      },
      {
        'name': 'An Nam Hue Boutique',
        'rating': 9.2,
        'reviews': 'Tuyệt hảo • 34 đánh giá',
        'location': 'Cư Chinh • Cách bạn 0,9km',
        'room': '1 phòng khách sạn: 1 giường',
        'price': 'US\$20',
        'image':
            'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400',
        'tag': 'Bao bữa sáng'
      },
      {
        'name': 'Huế Jade Hill Villa',
        'rating': 8.0,
        'reviews': 'Rất tốt • 1 đánh giá',
        'location': 'Cư Chinh • Cách bạn 1,3km',
        'room': '1 biệt thự nguyên căn – 4 giường',
        'price': 'US\$285',
        'image':
            'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400',
        'tag': 'Bao bữa sáng'
      },
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back), onPressed: () {}),
                  const SizedBox(width: 8),
                  const Expanded(
                      child: Text(
                          'Xung quanh vị trí hiện tại    23 thg 10 – 24 thg 10',
                          style: TextStyle(fontSize: 14))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.sort),
                          label: const Text('Sắp xếp'),
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12)))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                          label: const Text('Lọc'),
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12)))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.map),
                          label: const Text('Bản đồ'),
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12)))),
                ],
              ),
            ],
          ),
        ),
        Container(height: 8, color: Colors.grey[100]),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Text('999 chỗ nghỉ',
                style: TextStyle(color: Colors.grey[600], fontSize: 14))),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Đã chọn: ${hotel['name']}'),
                          duration: const Duration(seconds: 1))),
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(hotel['image'] as String,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover)),
                          Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(hotel['tag'] as String,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)))),
                          Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      icon: const Icon(Icons.favorite_border,
                                          size: 20),
                                      onPressed: () {}))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hotel['name'] as String,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Row(
                                children: List.generate(
                                    5,
                                    (i) => Icon(Icons.star,
                                        size: 16,
                                        color: i < 4
                                            ? Colors.amber
                                            : Colors.grey[300]))),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(hotel['rating'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))),
                                const SizedBox(width: 8),
                                Text(hotel['reviews'] as String,
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 13)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(hotel['location'] as String,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 13))
                            ]),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(hotel['room'] as String,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 13))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(hotel['price'] as String,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    Text('Đã bao gồm thuế và phí',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(children: [
                              Icon(Icons.check_circle,
                                  size: 16, color: Colors.green[700]),
                              const SizedBox(width: 4),
                              Text('Không cần thanh toán trước',
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
