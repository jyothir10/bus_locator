import 'package:bus_locator/Searching/blocs/search_bloc.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search_Screen';
  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final _bloc = SearchBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<Widget>(
            stream: _bloc.stateStream,
            initialData: Text("Please search to find jobs."),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) => _bloc.eventSink.add(
                          {"event": SearchScreenEvent.query, "value": value}),
                      maxLines: 1,
                      decoration: InputDecoration(
                        helperText: "Search",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 5,
                    child: snapshot.data,
                  )
                ],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    // _bloc.dispose();
    super.dispose();
  }
}
