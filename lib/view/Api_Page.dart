import 'package:bloc_demo/Controller/ApiController.dart';
import 'package:bloc_demo/Model/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Api_Page extends StatefulWidget {
  const Api_Page({Key? key}) : super(key: key);

  @override
  State<Api_Page> createState() => _Api_PageState();
}

class _Api_PageState extends State<Api_Page> {
  ApiBloc apiBloc = ApiBloc();
  @override
  void initState() {
    apiBloc.eventSink.add(ApiEvent.fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NewsModel>(
        stream: apiBloc.newsStream,
        builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                var info = snapshot.data!.articles![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network("${info.urlToImage}"),
                    title: Text("${info.title}"),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
