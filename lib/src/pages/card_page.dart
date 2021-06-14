import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build( context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('La comunidad de flutter Dominicana junta a todos los desarrolladores, expertos o iniciantes. '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {

                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {

                },
              ),
            ],
          )
        ],
      ),
    );
  }

  _cardType2() {
    final card = Container(
//      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://www.mtcfederal.com/wp-content/uploads/2018/07/GettyImages-909097764-1024x683.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
//          Image(
//            image: NetworkImage('https://www.mtcfederal.com/wp-content/uploads/2018/07/GettyImages-909097764-1024x683.jpg'),
//          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea  de que poner'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
