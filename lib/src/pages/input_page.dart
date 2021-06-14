import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name           = '';
  String _email          = '';
  String _password       = '';
  String _date           = '';
  String _optionSelect   = 'Volar';

  List _poders           = ['Volar', 'Rayos x', 'Super Fuerza', 'Super Aliento'];

  TextEditingController _editingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),

        ],
      ),
    );
  }

 Widget _createInput() {
    return TextField(
//      autofocus: true,
    textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _name.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo  el Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        this._name = value;
        print( this._name );
        setState(() {
          this._name = value;
        });
      },
    );
  }

 Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_name '),
      subtitle: Text('Email: es $_email '),
      trailing: Text( _optionSelect ),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
      ),
      onChanged: (value) =>  setState(() {
        this._email = value;
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration:  InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)
      ),
      onChanged: (value) =>  setState(() {
        _password = value;
      }),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _editingController,
      enableInteractiveSelection: false,
      decoration:  InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
    );

    if(picked != null) {
      setState(() {
        _date = picked.toString();
        _editingController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionsDropdown() {

    List<DropdownMenuItem<String>> list = new List<DropdownMenuItem<String>>();

    _poders.forEach((element) { 
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _optionSelect,
          items: getOpcionsDropdown(),
          onChanged: ( opcions ) {
            print(opcions);
            setState(() {
              _optionSelect = opcions;
            });
          },
        )
//        Expanded(
//          child: DropdownButton(
//            value: _optionSelect,
//            items: getOpcionsDropdown(),
//            onChanged: ( opcions ) {
//              print(opcions);
//              setState(() {
//                _optionSelect = opcions;
//              });
//            },
//          ),
//        )
      ],
    );
  }
}
