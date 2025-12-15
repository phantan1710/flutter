import 'package:flutter/material.dart';

class Bai1Screen extends StatelessWidget {
  const Bai1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'XML và ứng dụng - Nhóm 1',
        'code': '2025-2026.1.TIN4583.001',
        'students': '58 học viên',
        'color': const Color(0xFF424242)
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.006',
        'students': '55 học viên',
        'color': const Color(0xFF5F4C4C)
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.005',
        'students': '52 học viên',
        'color': const Color(0xFF4A5568)
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.004',
        'students': '50 học viên',
        'color': const Color(0xFF2D5A8F)
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.003',
        'students': '52 học viên',
        'color': const Color(0xFF424242)
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: course['color'] as Color,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=400'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Đã chọn: ${course['title']}'),
                  duration: const Duration(seconds: 1))),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(course['title'] as String,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        IconButton(
                            icon: const Icon(Icons.more_vert,
                                color: Colors.white),
                            onPressed: () {}),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(course['code'] as String,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14)),
                    const SizedBox(height: 16),
                    Text(course['students'] as String,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
