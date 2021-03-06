import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_model.dart';
//import 'package:timeago/timeago.dart' as timeago;
class Details extends StatelessWidget {
  String? tag;
  News? item;
  Details({Key? key, this.item, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: '${item?.title}',
                    child: Image.network('${item?.imageUrl}', height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit:BoxFit.cover)),
                SizedBox(
                  height: 10,
                  //BoxFit.fill
                  //fit:BoxFit.fill
                  //width: 100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Text(
                        '${item?.title}',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            '${item?.author}',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(Icons.date_range),
                          Text(
                            '${(item?.date)}',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '${item?.description}',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
