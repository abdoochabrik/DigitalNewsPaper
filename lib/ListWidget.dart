import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_model.dart';

Widget listWidget(News news) {
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.0),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Hero(
            tag: '${news.title}',
            child: Container(
              width: 80,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${news.imageUrl}'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${news.title}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    '${news.author}',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.date_range),
                Text(
                    '${news.date?.year}-${news.date?.month}-${news.date?.day}',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    ),
  );
}
