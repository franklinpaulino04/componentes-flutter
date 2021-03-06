import 'package:flutter/cupertino.dart';

//*************************** PAGES ************************************//
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_pages.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
    '/'       : (BuildContext context ) => HomePage(),
    'alert'   : (BuildContext context ) => AlertPage(),
    'avatar'  : (BuildContext context ) => AvatarPage(),
    AvatarPage.pageName  : (BuildContext context ) => AvatarPage(),
    'card'    : (BuildContext context ) => CardPage(),
    'inputs'  : (BuildContext context ) => InputPage(),
    'slider'  : (BuildContext context ) => SliderPage(),
    'list'    : (BuildContext context ) => ListPage(),
  };

}