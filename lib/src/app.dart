import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//*************************** PAGES ************************************//
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/route.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
//      home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {
        print('Ruta llamada: ${ settings.name }');

        return MaterialPageRoute(
          builder: (BuildContext context ) => AlertPage()
        );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
      ],
    );
  }
}