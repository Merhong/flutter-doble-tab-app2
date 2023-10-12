import 'package:flutter/material.dart';

/// Flutter code sample for [TabBar].

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Primary and secondary TabBar'),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Outside',
                icon: Icon(Icons.landscape),
              ),
              Tab(
                text: 'Sky',
                icon: Icon(Icons.cloud),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Home'),
            NestedTabBar('Outside'),
            NestedTabBar('Sky'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final TabController _tabController2;

  @override
  void initState() {
    super.initState();
    // length = 탭의 항목 수
    _tabController = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'A'),
            Tab(text: 'B'),
            Tab(text: 'C'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: A tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: B tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: C tab')),
              ),
            ],
          ),
        ),
        TabBar.secondary(
          controller: _tabController2,
          tabs: const <Widget>[
            Tab(text: 'D'),
            Tab(text: 'E'),
            Tab(text: 'F'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController2,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: D tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: E tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: F tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
