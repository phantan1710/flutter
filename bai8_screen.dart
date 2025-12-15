import 'package:flutter/material.dart';

class Bai8Screen extends StatefulWidget {
  const Bai8Screen({super.key});

  @override
  State<Bai8Screen> createState() => _Bai8ScreenState();
}

class _Bai8ScreenState extends State<Bai8Screen> {
  List<Map<String, dynamic>> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() => _isLoading = true);

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data with images from Unsplash
    setState(() {
      _products = [
        {
          'id': 1,
          'title': 'iPhone 9',
          'description': 'An apple mobile which is nothing like apple',
          'price': 549,
          'discountPercentage': 12.96,
          'rating': 4.69,
          'brand': 'Apple',
          'thumbnail':
              'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=400'
        },
        {
          'id': 2,
          'title': 'iPhone X',
          'description':
              'SIM-Free, Model A19211 6.5-inch Super Retina HD display',
          'price': 899,
          'discountPercentage': 17.94,
          'rating': 4.44,
          'brand': 'Apple',
          'thumbnail':
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400'
        },
        {
          'id': 3,
          'title': 'Samsung Universe 9',
          'description':
              'Samsungs new variant which goes beyond Galaxy to the Universe',
          'price': 1249,
          'discountPercentage': 15.46,
          'rating': 4.09,
          'brand': 'Samsung',
          'thumbnail':
              'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400'
        },
        {
          'id': 4,
          'title': 'OPPO F19',
          'description': 'OPPO F19 is officially announced on April 2021',
          'price': 280,
          'discountPercentage': 17.91,
          'rating': 4.3,
          'brand': 'OPPO',
          'thumbnail':
              'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400'
        },
        {
          'id': 5,
          'title': 'Huawei P30',
          'description': 'Huaweis re-badged P30 Pro New Edition',
          'price': 499,
          'discountPercentage': 10.58,
          'rating': 4.09,
          'brand': 'Huawei',
          'thumbnail':
              'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?w=400'
        },
        {
          'id': 6,
          'title': 'MacBook Pro',
          'description': 'MacBook Pro 2021 with mini-LED display may launch',
          'price': 1749,
          'discountPercentage': 11.02,
          'rating': 4.57,
          'brand': 'Apple',
          'thumbnail':
              'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400'
        },
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchProducts,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchProducts,
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(product['title'],
                                style: const TextStyle(fontSize: 16)),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product['thumbnail'],
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        height: 150,
                                        color: Colors.grey[300],
                                        child:
                                            const Icon(Icons.image, size: 50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(product['description'],
                                      style: const TextStyle(fontSize: 13)),
                                  const SizedBox(height: 8),
                                  Text('Giá: \$${product['price']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                  const SizedBox(height: 4),
                                  Text(
                                      'Giảm giá: ${product['discountPercentage']}%',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red[600])),
                                  const SizedBox(height: 4),
                                  Text('Thương hiệu: ${product['brand']}',
                                      style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Đóng'),
                              ),
                            ],
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product['thumbnail'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(Icons.image,
                                          size: 50, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['title'],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${product['price']}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text(
                                  '${product['rating']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Mở bài viết gốc'), backgroundColor: Colors.blue),
          );
        },
        label: const Text('Mở bài viết gốc'),
        icon: const Icon(Icons.open_in_new),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
