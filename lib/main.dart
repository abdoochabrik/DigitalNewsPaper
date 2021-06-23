import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Tab> _tabList = [
    Tab(child: Text("sport"),),
     Tab(child: Text("deucation"),),
      Tab(child: Text("politique"),),
       Tab(child: Text("corona"),)
  ];

  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text("News App", style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(padding: EdgeInsets.all(0.0),
          child: Container(),
          ),
           Padding(padding: EdgeInsets.all(8.0),
          child: Container(),
          ),
           Padding(padding: EdgeInsets.all(8.0),
          child: Container(),
          ),
           Padding(padding: EdgeInsets.all(8.0),
          child: Container(),
          ),
        
        ],)
        ,
    );
  }
}