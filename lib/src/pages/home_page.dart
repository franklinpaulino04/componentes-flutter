import 'package:flutter/material.dart';

//*************************** PAGES ************************************//
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  //************************* FUNCTIONS *********************************//

 Widget _list() {

   return FutureBuilder(
     future: menuProvider.loadData(),
     initialData: [],
     builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

       return new ListView(
         children: _listItems(snapshot.data, context ),
       );

     },
   );


  }

 List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opcions = [];
    data.forEach((item) {

      final widgetTemp = ListTile(
        title: Text(item['texto']),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {

          Navigator.pushNamed(context, item['ruta']);
//          //* metodo para navegar a otra pantalla *//
//          final route = MaterialPageRoute(
//            builder: ( context ) => AlertPage()
//          );
//          Navigator.push(context, route);
        },
      );

      opcions..add(widgetTemp)
             ..add(Divider());
    });

    return opcions;
  }
}
