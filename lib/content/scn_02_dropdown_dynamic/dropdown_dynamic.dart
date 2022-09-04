import 'package:flutter/material.dart';

class DropdownDynamic extends StatefulWidget {
  static const String ROUTE         = '/dropdown_dynamic';

  @override
  State<DropdownDynamic> createState() => _DropdownDynamicState();
}

class _DropdownDynamicState extends State<DropdownDynamic> {

  dynamic _selectedMoon;

  void _update() {
  	if( mounted )
  		setState(() {});
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
        appBar: AppBar(
          title: Text( 'Dropdown dynamic type' ),
          centerTitle: true,

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              DropDownDynamicType(
                items: [
                  DropdownMenuItem( value: 'io', child: Text( 'Io') ),
                  DropdownMenuItem( value: 'eu', child: Text( 'Europa') ),
                  DropdownMenuItem( value: 'ga', child: Text( 'Ganymede') ),
                  DropdownMenuItem( value: 'ca', child: Text( 'Callisto') ),
                ],

                onChanged: ( value ) {
                  _selectedMoon = value.toString();
                  _update();
                },
              ),

              Text( "Selected Moon: " + ( _selectedMoon ?? '' ) ),
            ],
          ),
        )
    );
  }
}


/** ===============================================
 *  This is the DropDownEnum
 *  ===============================================*/


class DropDownDynamicType<T> extends StatefulWidget {

  final List<DropdownMenuItem<dynamic>> items;
  final ValueChanged<T?>? onChanged;

  DropDownDynamicType( {
    required this.items,
    required this.onChanged,
  } );

  @override
  _DropDownDynamicTypeState createState() => _DropDownDynamicTypeState();
}

class _DropDownDynamicTypeState extends State<DropDownDynamicType> {

  dynamic _selected;

  void _update() {
    if( mounted )
      setState(() {});
  }

  @override
  Widget build( BuildContext context ) {
    return DropdownButton<dynamic>(
      items: widget.items,

      disabledHint: Text( 'This is a DISABLED hint' ),
      hint: Text( 'This is a hint' ),

      value: _selected,

      onChanged: ( value ) {
        _selected = value;
        widget.onChanged?.call( value );
        _update();
      },
    );
  }
}
