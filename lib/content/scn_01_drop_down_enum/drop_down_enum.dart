import 'dart:math';

import 'package:flutter/material.dart';

class DropDownEnum extends StatefulWidget {

  static const String ROUTE         = '/drop_down_enum';

  @override
  State<DropDownEnum> createState() => _DropDownEnumState();
}

class _DropDownEnumState extends State<DropDownEnum> {

  _QueenBeeType _selectedQueenDropDownValue = _QueenBeeType.Select;

  void saveSelectedQueenBee( { required _QueenBeeType selectedQueenBee } ) {
    _selectedQueenDropDownValue = selectedQueenBee;
    _update();
  }

  void _update() {
  	if( mounted )
  		setState(() {});
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('DropDownList using enum'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _DisplaySavingState(),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only( top: 30.0),
        child: Column(

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                /// When defining a DropdownButton it is common to use a value type of
                /// <String> but it doesn't have to be. You can use any type that you want.
                /// The 'value' is how you identify the selected item in your code.
                /// The 'child' is the text that is displayed in the dropdown for the user.
                /// For instance, you may want to show the user a dropdown of a list of countries,
                /// like: 'Select a Country', 'United States', 'United Kingdom', 'Canada', etc.
                /// But when they select a country you want to store that data as something
                /// like 'US', 'UK', 'CA', etc.
                DropdownButton<_QueenBeeType>(
                  value: _selectedQueenDropDownValue,
                  items: [
                    DropdownMenuItem(
                      value: _QueenBeeType.Select,
                      child: Text( _QueenBeeExtension( _QueenBeeType.Select ).name ),
                    ),
                    DropdownMenuItem(
                      value:  _QueenBeeType.Carniolan,
                      child: Text( _QueenBeeExtension( _QueenBeeType.Carniolan ).name ),
                    ),
                    DropdownMenuItem(
                      value: _QueenBeeType.Carpathian,
                      child: Text( _QueenBeeExtension( _QueenBeeType.Carpathian ).name ),
                    ),
                    DropdownMenuItem(
                      value: _QueenBeeType.Russian,
                      child: Text( _QueenBeeExtension( _QueenBeeType.Russian ).name ),
                    ),
                    DropdownMenuItem(
                      value: _QueenBeeType.Italian,
                      child: Text( _QueenBeeExtension( _QueenBeeType.Italian ).name),
                    ),
                  ],
                  onChanged: ( value ) {
                    _SavingController().setUnsavedState();

                    saveSelectedQueenBee(
                        selectedQueenBee: ( value == null )
                            ? _QueenBeeType.Select
                            : value );
                  },
                ),

                SizedBox( width: 25,),

                ElevatedButton(
                  onPressed: () {
                    _SavingController().saveQueenType(
                        queenBeeType: _selectedQueenDropDownValue
                    );
                    _update();
                  },
                  child: Text( 'Save', ),
                ),
              ],
            ),

            SizedBox( height: 25, ),

            Text(
                "Selected QueenBeeType: " + _SavingController().selectedQueenBeeType.toString()
            ),


            SizedBox( height: 20 ,),
          ],
        ),
      ),
    );
  }
}

/** ===============================================
 *  Widget that changes state based on a stream
 *  ===============================================*/
class _DisplaySavingState extends StatefulWidget {

  @override
  State<_DisplaySavingState> createState() => _DisplaySavingStateState();
}

class _DisplaySavingStateState extends State<_DisplaySavingState> {
  _SavingStateEnum _savingState = _SavingStateEnum.saved;

  @override
  void initState() {
    _SavingController().addListener(() {savingStateChanged();});
    super.initState();
  }

  void savingStateChanged() {
    _savingState = _SavingController().savingState;
    _update();
  }

  void _update() {
  	if( mounted )
  		setState(() {});
  }

  @override
  Widget build( BuildContext context ) {
    switch( _savingState ) {
      case _SavingStateEnum.saved:
        return Text( 'Saved' );
      case _SavingStateEnum.saving:
        return Text( 'Saving' );
      case _SavingStateEnum.unsaved:
        return Text( 'Unsaved' );
      case _SavingStateEnum.error:
        return Text( 'Error' );
    }
  }
}


/** ===============================================
 *  Controller for the stream state
 *  ===============================================*/
class _SavingController extends ChangeNotifier {
  static final _SavingController _ = _SavingController._internal();
  factory _SavingController() => _;
  _SavingController._internal();

  _SavingStateEnum _savingState = _SavingStateEnum.saved;
  _SavingStateEnum get savingState => _savingState;

  _QueenBeeType _selectedQueenBeeType = _QueenBeeType.Select;
  _QueenBeeType get selectedQueenBeeType => _selectedQueenBeeType;

  void setUnsavedState() {
    _savingState = _SavingStateEnum.unsaved;
    notifyListeners();
  }

  void saveQueenType( { required _QueenBeeType queenBeeType } ) async {
    _selectedQueenBeeType = queenBeeType;

    /// Notify any listeners of the change
    _savingState = _SavingStateEnum.saving;
    notifyListeners();

    int rnd = Random().nextInt(100);
    print( 'rnd: $rnd' );

    await Future.delayed( const Duration( seconds: 2 ), () {} );

    if( rnd < 80 ) {
      _savingState = _SavingStateEnum.saved;
    } else {
      _savingState = _SavingStateEnum.error;
    }

    notifyListeners();
  }


}

enum _SavingStateEnum {
  saved,
  saving,
  unsaved,
  error,
}

enum _QueenBeeType {
  Select,
  Italian,
  Carpathian,
  Russian,
  Carniolan,
}

extension _QueenBeeExtension on _QueenBeeType {

  String get name {
    switch( this ) {
      case _QueenBeeType.Select:
        return 'Select a Queen';
      case _QueenBeeType.Italian:
        return 'Italian';
      case _QueenBeeType.Carpathian:
        return 'Carpathian';
      case _QueenBeeType.Russian:
        return 'Russian';
      case _QueenBeeType.Carniolan:
        return 'Carniolan';
    }
  }
}