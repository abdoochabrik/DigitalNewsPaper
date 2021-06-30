import 'package:flutter/material.dart';
import 'package:flutter_application_1/ListWidget.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/locator.dart';
import 'package:flutter_application_1/models/news_model.dart';
import 'package:flutter_application_1/services/news_service.dart';

//import 'package:lipsum/lipsum.dart' as lipsum;
void main() {
  setup();
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var service = locator.get<NewsService>();
  Future<List<News>?>? _apiResponse;
  List<News>? _news = [];
  _fetchNews(String category) async {
    setState(() {
      _apiResponse = service.getNews(category);
    });
    return service.getNews(category);
  }

  List<Tab> _tabList = [
    Tab(
      child: Text("sport"),
    ),
    Tab(
      child: Text("education"),
    ),
    Tab(
      child: Text("politique"),
    ),
    Tab(
      child: Text("corona"),
    )
  ];

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _fetchNews("Sport");
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  FutureBuilder ShowDataByCategory(String category) {
    return FutureBuilder(
      future: _fetchNews(category),
      builder: (context, snapshot) {
        List<News>? news = snapshot.data as List<News>?;
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: news?.length,
              itemBuilder: (context, index) {
                var list = news!;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                item: news[index], tag: news[index].title)));
                  },
                  child: listWidget(list[index]),
                );
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ShowDataByCategory("Sport"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ShowDataByCategory("Education"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ShowDataByCategory("Politique"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ShowDataByCategory("Covid"),
            ),
          ),
        ],
      ),
    );
  }
}
