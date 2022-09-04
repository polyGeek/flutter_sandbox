import 'package:flutter/material.dart';
import 'package:flutter_sandbox/content/scn_01_drop_down_enum/drop_down_enum.dart';
import 'package:flutter_sandbox/content/scn_02_dropdown_dynamic/dropdown_dynamic.dart';
import 'package:flutter_sandbox/content/scn_03_dropdown_form/dropdown_form.dart';
import 'package:flutter_sandbox/content/scn_04_stream_builder/stream_builder_test.dart';
import 'package:flutter_sandbox/content/scn_05_flutter330/flutter330.dart';

/// Commit test
void main() {
    runApp(
        MaterialApp(

            /*theme: ThemeData(
                useMaterial3: true
            ),*/
            home: _MainNav(),
            theme: ThemeData.dark( useMaterial3: true ),
            debugShowCheckedModeBanner: false,
            routes: {
                DropDownEnum.ROUTE: ( BuildContext context ) => DropDownEnum(),
                DropdownDynamic.ROUTE: ( BuildContext context ) => DropdownDynamic(),
                DropDownFormExample.ROUTE: ( BuildContext context ) => DropDownFormExample(),
                StreamDemo.ROUTE: ( BuildContext context ) => StreamDemo(),
                Flutter330Exploration.ROUTE: ( BuildContext context ) => Flutter330Exploration(),
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
                            routePath: DropDownEnum.ROUTE,
                        ),

                        _SandboxRenderer(
                            title: "DropDownDynamic<T>",
                            description: "Simple modified DropDown using dynamic types.",
                            createdBy: "Dan",
                            routePath: DropdownDynamic.ROUTE,
                        ),

                        _SandboxRenderer(
                            title: "Dropdown Form",
                            description: "Red screen:",
                            createdBy: "Dan",
                            routePath: DropDownFormExample.ROUTE,
                        ),

                        _SandboxRenderer(
                            title: "Stream Builder Demo",
                            description: "Create a stream builder that listens to a stream and prints the value.",
                            createdBy: "Dan",
                            routePath: StreamDemo.ROUTE,
                        ),

                        _SandboxRenderer(
                            title: "Flutter 3.3.0",
                            description: "Large Appbar",
                            createdBy: "Dan",
                            routePath: Flutter330Exploration.ROUTE,
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
