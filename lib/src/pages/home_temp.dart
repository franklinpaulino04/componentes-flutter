import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTemp extends StatelessWidget {

  final _opcions = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build( context ) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _addItems()
      ),
    );
  }


  //************************ FUNCTIONS ********************************//
  List<Widget> _addItems() {
    List<Widget> _list = new List<Widget>();

//    this._opcions.forEach( (element) {
//
//      _list.add(
//        ListTile(
//          title: Text(element),
//        ),
//      );

//     _list.add(Divider());
//    });

//    for (String opt in _opcions) {
//
//      final tempWidget = ListTile(
//        title: Text(opt),
//      );
//
//      _list..add(tempWidget)
//           ..add(Divider());
//    }

    return _opcions.map((item) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item),
              subtitle: Text('Cualquier cosa '),
              leading: Icon(Icons.account_balance_wallet),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            Divider()
          ],
        );
    }).toList();


//    return _list;
  }
}