import 'package:flutter/material.dart';

class Flutter330Exploration extends StatelessWidget {
  static const String ROUTE = 'Flutter330Exploration';

  @override
    Widget build( BuildContext context ) {
        return DefaultTabController(
					length: 3,
          child: Scaffold(
          			appBar: AppBar(
								actions: [
									IconButton(
										icon: Icon( Icons.add ),
										onPressed: (){},
									),
								],
								actionsIconTheme: IconThemeData(
									color: Colors.purpleAccent,
								),

								bottom: TabBar(

										tabs: [
									Tab( text: 'Tab 1', ),
									Tab( text: 'Tab 2', ),
									Tab( text: 'Tab 3', ),
								]),

								scrolledUnderElevation: 10,
								shadowColor: Colors.greenAccent,
								backgroundColor: Colors.black45,
								toolbarOpacity: 0.5,
								bottomOpacity: 0.5,
								titleSpacing: 10,
								elevation: 10,

									/*flexibleSpace: FlexibleSpaceBar(
										title: Text( 'Flutter 330 Exploration' ),
										centerTitle: true,
								),*/

								automaticallyImplyLeading: true,
          				centerTitle: true,
          			),
          			body: TabBarView(
          			  children: [
										Container(
											color: Colors.red,
										),

										Container(
											color: Colors.green,
										),

										Container(
											color: Colors.blue,
										),


								  ],
          			),
          		),
        );
    }
}
