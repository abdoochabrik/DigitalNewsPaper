import 'package:flutter/material.dart';
import 'package:flutter_application_1/ListWidget.dart';
import 'package:flutter_application_1/shared/Listitem.dart';
//import 'package:lipsum/lipsum.dart' as lipsum;
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


   List<Listitem> ListTitles = [
       Listitem("https://brightrockmedia.com/wp-content/uploads/2020/06/Magus.jpg",
        "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
        "hhhhhhhhhhhhh", 
        "28 jan 2018"),
        Listitem("https://brightrockmedia.com/wp-content/uploads/2020/06/Magus.jpg",
        "hhh",
       "hhh", 
        "28 jan 2018"),
       Listitem("https://brightrockmedia.com/wp-content/uploads/2020/06/Magus.jpg",
      "hhh", 
      "hhh", 
      "28 jan 2018"),
       Listitem("https://www.bfh.ch/dam/jcr:b69aa727-c5ea-46d6-abe3-4f323be68083/Studiengang_Bsc%20EHSM%20in%20Sports.jpg",
       "hhh", 
       "hhh",  
        "28 jan 2018"),    
   ];


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
        toolbarHeight: 110,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text("News App", style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
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
          Padding(padding: EdgeInsets.all(8.0),
          child: Container(
            child: ListView.builder(
              itemCount: ListTitles.length,
              itemBuilder: (context, index) {
                   return InkWell(
                      onTap: () {},
                      child: listWidget(ListTitles[index]),
                   );
              }),
          ),
          ),
           Padding(padding: EdgeInsets.all(8.0),
          child: Container(

          ),
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