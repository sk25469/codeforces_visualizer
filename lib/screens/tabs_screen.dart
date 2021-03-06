import 'package:codeforces_visualizer/screens/contest_screen.dart';
import 'package:codeforces_visualizer/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String _usrName = ModalRoute.of(context)!.settings.arguments as String;
    final List<Map<String, Object>> _pages = [
      {
        'page': const ContestScreen(),
        'title': 'Upcoming Contests',
      },
      {
        'page': UserInfoScreen(_usrName),
        'title': 'My Stats',
      },
    ];

    var appBar = AppBar(
      title: Text(_pages[_selectedPageIndex]['title'] as String),
    );

    return Scaffold(
      appBar: appBar,
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        reverse: true,
        items: [
          TitledNavigationBarItem(
            title: const Text('Contests'),
            icon: const Icon(Icons.calendar_today),
          ),
          TitledNavigationBarItem(
            title: const Text('Stats'),
            icon: const Icon(Icons.query_stats),
          ),
        ],
      ),
    );
  }
}
