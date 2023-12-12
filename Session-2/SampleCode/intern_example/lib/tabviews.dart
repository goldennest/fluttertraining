import 'package:flutter/material.dart';

class Tabpage extends StatefulWidget {
  @override
  _Tabpage createState() => _Tabpage();
}

class _Tabpage extends State<Tabpage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabController Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Tab 1'),
            Tab(icon: Icon(Icons.search), text: 'Tab 2'),
            Tab(icon: Icon(Icons.favorite), text: 'Tab 3'),
            Tab(icon: Icon(Icons.settings), text: 'Tab 4'),
            Tab(icon: Icon(Icons.person), text: 'Tab 5'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Contents for Tab 1
          Center(child: Text('Tab 1 Content')),
          // Contents for Tab 2
          Center(child: Text('Tab 2 Content')),
          // Contents for Tab 3
          Center(child: Text('Tab 3 Content')),
          // Contents for Tab 4
          Center(child: Text('Tab 4 Content')),
          // Contents for Tab 5
          Center(child: Text('Tab 5 Content')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
