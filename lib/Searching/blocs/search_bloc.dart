import 'dart:async';
import 'package:bus_locator/Searching/model/shops.dart';
import 'package:flutter/material.dart';

// This enum consists of various events that can happen on the search screen.
// Feel free to add circular progress bar while the query is being processed.
// But it might be hard to implement
enum SearchScreenEvent { query }

class SearchBloc {
  final _stateController = StreamController<Widget>();
  Stream get stateStream => _stateController.stream;
  StreamSink get _stateSink => _stateController.sink;

  final _eventController = StreamController<Map>();
  StreamSink get eventSink => _eventController.sink;
  final Shops _shops = Shops();

  SearchBloc() {
    _eventController.stream.listen(_mapEventState);
  }

  //TODO Change the query call and replace shopList
  void _mapEventState(Map map) async {
    _stateSink.add(CircularProgressIndicator());
    switch (map["event"]) {
      case SearchScreenEvent.query:
        {
          // TODO Change this to send your http request
          List shops = await _shops.fetchShop(map["value"]);
          if (shops.length != 0 || shops.length == 0)
            _stateSink.add(buildCardListView(shops));
          // TODO create beatiful widgets to handle these cases
          else if (map["value"] == "")
            _stateSink.add(Text("Enter a value to search"));
          else
            _stateSink.add(Text("No results"));
          break;
        }
    }
  }

  // TODO Change it for database
  Widget buildCard(String name, String fare) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(name),
          Text(fare),
        ],
      ),
    );
  }

  // TODO Change it for database
  Widget buildCardListView(List items) {
    List<Widget> list = [];
    if (items.length == 0){
      list.add(buildCard("No data Available","--"));
    }
    else{
      for (final i in items) {
        list.add(buildCard(i["busname"], i["fare"]));
      }
    }
    return ListView(children: list);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
