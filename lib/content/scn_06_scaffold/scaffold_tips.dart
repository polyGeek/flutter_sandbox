import 'package:flutter/material.dart';


/** ===============================================
*  https://nikkitagandhi.medium.com/basic-scaffold-structure-994e6a3a9e16
*  ===============================================*/
class ScaffoldTips extends StatefulWidget {
	static const String ROUTE = 'ScaffoldTips';

  @override
	_ScaffoldTipsState createState() => _ScaffoldTipsState();
}

class _ScaffoldTipsState extends State<ScaffoldTips> {

	@override
	void initState() {
		super.initState();

	}

	@override
	void dispose() {

		super.dispose();
	}

	void _update(){
		if( mounted )
			setState(() {});
	}



	@override
	Widget build( BuildContext context ) {
		return Scaffold(

			/// Set the size of the app bar.
			appBar: PreferredSize(
				preferredSize: Size.fromHeight( 50 ),
			  child: AppBar(
			  	title: Text( 'Scaffold Tips' ),
			  	centerTitle: true,
			  ),
			),

			/// Show a drawer on the left side of the screen.
			drawer: _drawer(),

			/// This will automatically display the bottomSheet when the screen is built.
			/// Or, it can be called programmatically with showModalBottomSheet().
			//bottomSheet: _bottomSheet( context: context ),

			bottomNavigationBar: new BottomNavigationBar(
				items: [
					new BottomNavigationBarItem(
						icon: Icon(Icons.add),
						label: "Add",
					),
					new BottomNavigationBarItem(
						icon: Icon(Icons.edit),
						label: "Edit",
					),
					new BottomNavigationBarItem(
						icon: new Icon(Icons.delete),
						label: "Delete",
					),
				],
			),

			body: Padding( padding: const EdgeInsets.all(8.0),
				child: SingleChildScrollView(

					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,

						children: [

							Text( "Preferred size of the app bar", style: TextStyle( fontWeight: FontWeight.bold ), ),
							Text( "Wrap the AppBar in a PreferredSize widget and set the preferredSize property to the desired size." ),

							SizedBox( height: 20, ),

							Text( "BottomSheet", style: TextStyle( fontWeight: FontWeight.bold ), ),
							Text( "This will automatically display the bottomSheet when the screen is built." ),


							SizedBox( height: 20 ,),

							ElevatedButton(
								onPressed: (){
									showModalBottomSheet<void>(
										context: context,
										builder: (BuildContext context) {
											return _bottomSheet( context: context );
										},
									);
								},
								child: Text( "Show Bottom Sheet" ),
							),


						],
					),
				),
			),
		);
	}
}


Widget _drawer() {
	return Drawer(
		child: ListView(
			padding: EdgeInsets.zero,
			children: <Widget>[
				DrawerHeader(
					decoration: BoxDecoration(
						color: Colors.blue,
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,

					  children: [
							BackButton(
								color: Colors.white,
							),
					    Text( 'Drawer Header' ),
					  ],
					),
				),
				ListTile(
					title: Text( 'Item 1' ),
					onTap: () {
						// Update the state of the app.
						// ...
					},
				),
				ListTile(
					title: Text( 'Item 2' ),
					onTap: () {
						// Update the state of the app.
						// ...
					},
				),
			],
		),
	);
}

Widget _bottomSheet( { required BuildContext context } ) {
	return Container(
		height: 200,
		color: Colors.amber,
		child: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					const Text('Modal BottomSheet'),
					ElevatedButton(
						child: const Text('Close BottomSheet'),
						onPressed: () => Navigator.pop(context),
					),
				],
			),
		),
	);
}