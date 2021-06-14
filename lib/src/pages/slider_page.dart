import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool  _checked      = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
             _createSlider(),
             _createCheckbox(),
             _createSwitch(),
             Expanded(
                 child: _createImage()
             )
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
//      divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_checked) ? null : ( value ) {
        print( value );
        setState(() {
          _valueSlider = value;
        });

      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://as.com/meristation/imagenes/2020/02/22/noticias/1582368906_546922_1582368979_noticia_normal.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
//    return Checkbox(
//      value: _checked,
//      onChanged: (value) {
//        print(value);
//        setState(() {
//          _checked = value;
//        });
//      }
//    );

  return CheckboxListTile(
    title: Text('Bloquear slider'),
      value: _checked,
      onChanged: (value) {
        print(value);
        setState(() {
          _checked = value;
        });
      }
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _checked,
        onChanged: (value) {
          print(value);
          setState(() {
            _checked = value;
          });
        }
    );
  }
}
