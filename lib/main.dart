import 'package:flutter/material.dart';
import 'package:flutter_sandbox/content/scn_001_drop_down_enum/drop_down_enum.dart';
import 'package:flutter_sandbox/content/scr_002_dropdown_dynamic/dropdown_dynamic.dart';
import 'package:flutter_sandbox/content/scr_03_dropdown_form/dropdown_form.dart';

void main() {
    runApp(
        MaterialApp(
            home: _MainNav(),
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            routes: {
                DropDownEnum.ROUTE_PATH: ( BuildContext context ) => DropDownEnum(),
                DropdownDynamic.ROUTE_PATH: ( BuildContext context ) => DropdownDynamic(),
                DropDownFormExample.ROUTE_PATH: ( BuildContext context ) => DropDownFormExample(),
            },
        )
    );
}

class _MainNav extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(
                title: Text('Flutter Sandbox'),
            ),

            body: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListView(

                    children: [

                        _SandboxRenderer(
                            title: "DropDownList using enum",
                            description: "DropDown using values of type enum. "
                                "Also, an enum is used in a simulated 'saving state' widget.",
                            createdBy: "Dan",
                            routePath: DropDownEnum.ROUTE_PATH,
                        ),

                        _SandboxRenderer(
                            title: "DropDownDynamic<T>",
                            description: "Simple modified DropDown using dynamic types.",
                            createdBy: "Dan",
                            routePath: DropdownDynamic.ROUTE_PATH,
                        ),

                        _SandboxRenderer(
                            title: "Dropdown Form",
                            description: "Red screen:",
                            createdBy: "Dan",
                            routePath: DropDownFormExample.ROUTE_PATH,
                        ),

                    ],

                ),
            ),
        );
    }
}

class _SandboxRenderer extends StatelessWidget {

    final String title;
    final String description;
    final String createdBy;
    final String routePath;

    const _SandboxRenderer({
        required this.title,
        required this.description,
        required this.createdBy,
        required this.routePath,
    });

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
                Navigator.of( context ).pushNamed( routePath, );
            },
            child: Padding(
              padding: const EdgeInsets.only( bottom: 2 ),
              child: Container(
                  color: Colors.black54,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                              Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                  ),
                              ),

                              Text( description ),

                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text( 'by: $createdBy', ),
                              ),
                          ],
                      ),
                  ),
              ),
            ),
        );
    }
}
