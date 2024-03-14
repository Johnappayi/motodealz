import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Sidebar Example'),
      ),
      body: Stack(
        children: [
          // Main content
          Container(
            color: Colors.white,
            child: Center(
              child: Text('Main Content'),
            ),
          ),
          // Sidebar
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isSidebarOpen ? 0 : -200,
            top: 0,
            bottom: 0,
            width: 200,
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Sidebar Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle sidebar item tap
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Sidebar Item 2',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle sidebar item tap
                    },
                  ),
                ],
              ),
            ),
          ),
          // Sidebar toggle button
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isSidebarOpen = !_isSidebarOpen;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
