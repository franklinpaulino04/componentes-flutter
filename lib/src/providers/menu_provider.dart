
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MenuProvider {

  //class privada
  _MenuProvider(){}

  Future<List<dynamic>> loadData() async {

    List<dynamic> opcions = [];

    try
    {
       final response = await rootBundle.loadString('public/menu_opts.json');
       Map dataMap    = json.decode(response);
       opcions        = dataMap['rutas'];
    }
    catch(e)
    {
      print(e);
    }

    return opcions;

   }
}

final menuProvider = new MenuProvider();