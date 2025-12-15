import 'package:flutter/material.dart';
import 'bai1_screen.dart';
import 'bai2_screen.dart';
import 'bai3_screen.dart';
import 'bai4_screen.dart';
import 'bai5_screen.dart';
import 'bai6_screen.dart';
import 'bai7_screen.dart';
import 'bai8_screen.dart';
import 'bai9_screen.dart';
import 'bai10_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const Bai1Screen();
      case 1:
        return const Bai2Screen();
      case 2:
        return const Bai3Screen();
      case 3:
        return const Bai4Screen();
      case 4:
        return const Bai5Screen();
      case 5:
        return const Bai6Screen();
      case 6:
        return const Bai7Screen();
      case 7:
        return const Bai8Screen();
      case 8:
        return const Bai9Screen();
      case 9:
        return const Bai10Screen();
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment,
                  size: 100, color: Colors.blue.withOpacity(0.5)),
              const SizedBox(height: 20),
              Text('Bài ${_selectedIndex + 1}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Nội dung bài ${_selectedIndex + 1} sẽ được hiển thị ở đây',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bài ${_selectedIndex + 1}'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.menu_book, size: 60, color: Colors.white),
                      SizedBox(height: 10),
                      Text('Menu Bài Tập',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _selectedIndex == index
                            ? Colors.blue
                            : Colors.grey[300],
                        child: Text('${index + 1}',
                            style: TextStyle(
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      title: Text('Bài ${index + 1}',
                          style: TextStyle(
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedIndex == index
                                  ? Colors.blue
                                  : Colors.black87)),
                      selected: _selectedIndex == index,
                      selectedTileColor: Colors.blue.withOpacity(0.1),
                      onTap: () {
                        setState(() => _selectedIndex = index);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}
