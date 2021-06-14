import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  @override
  Widget build( context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://datosdefamosos.com/wp-content/uploads/2019/09/Stan_Lee-773x1024.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.nacionrex.com/__export/1542155984063/sites/debate/img/2018/11/13/stan_lee_personajes_que_creo_marvel_lista_completa.jpg_554688468.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
