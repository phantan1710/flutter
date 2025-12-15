import 'package:flutter/material.dart';

class Bai9Screen extends StatefulWidget {
  const Bai9Screen({super.key});

  @override
  State<Bai9Screen> createState() => _Bai9ScreenState();
}

class _Bai9ScreenState extends State<Bai9Screen> {
  List<Map<String, dynamic>> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() => _isLoading = true);

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data from jsonplaceholder.typicode.com/posts
    setState(() {
      _posts = [
        {
          'userId': 1,
          'id': 1,
          'title':
              'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
          'body':
              'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
          'image': 'https://picsum.photos/400/200?random=1'
        },
        {
          'userId': 1,
          'id': 2,
          'title': 'qui est esse',
          'body':
              'est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis',
          'image': 'https://picsum.photos/400/200?random=2'
        },
        {
          'userId': 1,
          'id': 3,
          'title':
              'ea molestias quasi exercitationem repellat qui ipsa sit aut',
          'body':
              'et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut',
          'image': 'https://picsum.photos/400/200?random=3'
        },
        {
          'userId': 1,
          'id': 4,
          'title': 'eum et est occaecati',
          'body':
              'ullam et saepe reiciendis voluptatem adipisci sit amet autem assumenda provident rerum culpa quis hic commodi nesciunt rem tenetur doloremque ipsam iure',
          'image': 'https://picsum.photos/400/200?random=4'
        },
        {
          'userId': 1,
          'id': 5,
          'title': 'nesciunt quas odio',
          'body':
              'repudiandae veniam quaerat sunt sed alias aut fugiat sit autem sed est voluptatem omnis possimus esse voluptatibus quis est aut tenetur dolor neque',
          'image': 'https://picsum.photos/400/200?random=5'
        },
        {
          'userId': 1,
          'id': 6,
          'title': 'dolorem eum magni eos aperiam quia',
          'body':
              'ut aspernatur corporis harum nihil quis provident sequi mollitia nobis aliquid molestiae perspiciatis et ea nemo ab reprehenderit accusantium quas voluptate dolores velit et doloremque',
          'image': 'https://picsum.photos/400/200?random=6'
        },
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin tức hôm nay'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchPosts)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchPosts,
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(post: post)));
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.network(post['image'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                        height: 200,
                                        color: Colors.grey[300],
                                        child:
                                            const Icon(Icons.error, size: 50))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(post['title'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 8),
                                Text(post['body'],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[700]),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Text('User ${post['userId']}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 8),
                                    Text('•',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                    const SizedBox(width: 8),
                                    Text('ID: ${post['id']}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600])),
                                  ],
                                ),
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
    );
  }
}

class NewsDetailScreen extends StatelessWidget {
  final Map<String, dynamic> post;

  const NewsDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(post['image'],
                height: 250, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post['title'],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.3)),
                  const SizedBox(height: 12),
                  Text(post['body'],
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey[700], height: 1.5)),
                  const SizedBox(height: 16),
                  Text(
                      'Bài viết này được tạo bởi User ${post['userId']}. ID bài viết: ${post['id']}',
                      style: TextStyle(
                          fontSize: 15, color: Colors.grey[800], height: 1.6)),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Mở bài viết gốc'),
                          backgroundColor: Colors.blue));
                    },
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: const Text('Mở bài viết gốc'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
