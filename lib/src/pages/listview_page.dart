import 'package:flutter/material.dart';

import 'dart:async';


class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumber              = new List();
  int _lastItems                     = 0;
  bool _isLoading                    = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _addList();

    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
//        _addList();
        fetchData();
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _fistRefresh,
      child: ListView.builder(
        controller: _scrollController,
          itemCount: _listNumber.length,
          itemBuilder: (BuildContext context, int index){
            final image = _listNumber[index];

            return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          }
      ),
    );
  }

  Future<Null> _fistRefresh() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, (){
      _listNumber.clear();
      _lastItems++;
      _addList();

    });

    return Future.delayed(duration);
  }

  void _addList(){
    for(int i =1; i< 10; i++){
      _lastItems++;
      _listNumber.add(_lastItems);
    }
    setState(() {

    });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() { });

    final duration = new Duration( seconds: 2);
    new Timer(duration, _responseHTTP );
  }

  void _responseHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn
    );

    _addList();
  }

  Widget _createLoading() {
    if( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }else{
      return Container();
    }
  }
}
