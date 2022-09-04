import 'package:flutter/material.dart';


class DropDownFormExample extends StatefulWidget {
  static const String ROUTE         = '/dropdown_form_example';

  @override
  State<DropDownFormExample> createState() => _DropDownFormExampleState();
}

class _DropDownFormExampleState extends State<DropDownFormExample> {

  String? selectedValue;

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem( value: "USA", child: Text("USA"), ),
    DropdownMenuItem( value: "Canada", child: Text("Canada") ),
    DropdownMenuItem( value: "Brazil", child: Text("Brazil") ),
    DropdownMenuItem( value: "England", child: Text("England")),
  ];

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Dropdown Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: <Widget>[

            DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent,
                ),
                dropdownColor: Colors.blueAccent,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems
            ),

            Text( 'Selected Country: $selectedValue' ),


          ],
        ),
      ),
    );
  }
}
