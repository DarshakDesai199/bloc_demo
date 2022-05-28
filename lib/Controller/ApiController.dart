import 'dart:async';

import 'package:bloc_demo/Model/NewsModel.dart';
import 'package:bloc_demo/Services/Services.dart';

enum ApiEvent { fetch, delete }

class ApiBloc {
  final _streamController = StreamController<NewsModel>();
  StreamSink<NewsModel> get newsSink => _streamController.sink;
  Stream<NewsModel> get newsStream => _streamController.stream;

  final _eventController = StreamController<ApiEvent>();
  StreamSink<ApiEvent> get eventSink => _eventController.sink;
  Stream<ApiEvent> get eventStream => _eventController.stream;

  ApiBloc() {
    eventStream.listen(
      (event) async {
        if (event == ApiEvent.fetch) {
          var data = await ApiServices.getData();
          if (data != null) {
            newsSink.add(data);
          } else {
            newsSink.addError("Something went to wrong");
          }
        }
      },
    );
  }
}
