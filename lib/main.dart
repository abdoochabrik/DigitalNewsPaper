import 'package:flutter/material.dart';
import 'package:flutter_application_1/ListWidget.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/locator.dart';
import 'package:flutter_application_1/models/news_model.dart';
import 'package:flutter_application_1/services/news_service.dart';
import 'package:flutter_application_1/shared/Listitem.dart';

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
  _fetchNews() async {
    setState(() {
      service.getNews().then((data) {
        _news = data;
        print(_news?[0]);
      });
    });
  }

  // List<Listitem> ListTitles = [
  //   Listitem(
  //       "https://medias.pourlascience.fr/api/v1/images/view/5d1b663a8fe56f77c8671165/wide_1300/image.jpg",
  //       "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
  //       "hhhhhhhhhhhhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://media.lesechos.com/api/v1/images/view/5e5e04b43e454609a3081d99/1280x720/0602862490248-web-tete.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://www.handisport.org/wp-content/uploads/2021/04/edf-sport-energie-1200x450.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://www.bfh.ch/dam/jcr:b69aa727-c5ea-46d6-abe3-4f323be68083/Studiengang_Bsc%20EHSM%20in%20Sports.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://thumb.canalplus.pro/bran/unsafe/x800/image/60531e10a28ec/uploads/media/Panoramic-Liga-CLASICORealMadridvsFCBarcelone.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  // ];
  // List<Listitem> ListTitles2 = [
  //   Listitem(
  //       "https://www.schooleducationgateway.eu/files/png5/ebeginswlanguage1.png",
  //       "hhhhhhhhhhhhhhhhhhhhh",
  //       "hhhhhhhhhhhhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://xscholarship.com/wp-content/uploads/2020/05/education.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem("", "hhh", "hhh", "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://ggsc.s3.amazonaws.com/images/uploads/Our_Best_Education_Articles_of_2020.jpg",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  //   Listitem(
  //       "https://www.un.org/sites/un2.un.org/files/styles/large-article-image-style-16-9/public/field/image/education_0.jpg?itok=El4TNk4U",
  //       "hhh",
  //       "hhh",
  //       "28 jan 2018",
  //       "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkhhhhhhhhhhhhhhhhhhhhhhhhhdalllllllllllllllllllllllllllllllllllllllllllllll"),
  // ];

  List<Tab> _tabList = [
    Tab(
      child: Text("sport"),
    ),
    Tab(
      child: Text("deucation"),
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
    _fetchNews();
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
              child: ListView.builder(
                  itemCount: _news?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item: _news?[index],
                                    tag: _news?[index].title)));
                      },
                      child: listWidget(_news![index]),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                  itemCount: _news?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item: _news?[index],
                                    tag: _news?[index].title)));
                      },
                      child: listWidget(_news![index]),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
