

import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
    static const String ROUTE_PATH = 'StreamDemo';

    @override
    State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
    @override
    Widget build( BuildContext context ) {
        return Scaffold(
            appBar: AppBar(
                title: Text( 'TITLE' ),
                centerTitle: true,
                actions: <Widget>[

                ],
            ),
            body: Padding( padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [

                            StreamBuilder<String> (
                                stream: NumberCreator().stream.map(( i ) => 'String $i' ),
                                builder: ( context, snapshot ) {
                                    if( snapshot.connectionState == ConnectionState.waiting ) {
                                        return Text( 'No data yet.' );
                                    } else if( snapshot.connectionState == ConnectionState.done ) {
                                        return Text( 'Stream closed.' );
                                    } else if( snapshot.hasError ) {
                                        return Text( 'Error: ${snapshot.error}' );
                                    } else {
                                        return Text( snapshot.data.toString() ?? 'Well, this was unexpected' );
                                    }
                                    Text( 'stream: ');
                                }
                            ),

                            SizedBox( height: 20 ,),

                            ElevatedButton(
                                onPressed: (){

                                },
                                child: Text( "SUBMIT" ),
                            ),


                            StreamBuilder<String> (
                                stream: NumberCreator().stream.map( ( i ) => 'String = $i' ),
                                builder: ( context, snapshot ) {
                                    print( 'snapshot: ${snapshot.toString()}' );
                                    if( snapshot.connectionState == ConnectionState.waiting ) {
                                        return Text( 'No data yet.' );
                                    } else if( snapshot.connectionState == ConnectionState.done ) {
                                        return Text( 'Stream closed.' );
                                    } else if( snapshot.hasError ) {
                                        return Text( 'Error: ${snapshot.error}' );
                                    } else {
                                        return Text( snapshot.data.toString() ?? 'Well, this was unexpected' );
                                    }
                                    Text( 'stream: ');
                                }
                            ),
                        ],
                    ),
                ),
            ),
        );;
    }
}

class NumberCreator {
    int _count = 1;
    final _controller = StreamController<int>();
    Stream<int> get stream => _controller.stream;

    NumberCreator() {
        Timer.periodic( Duration( seconds: 1 ), ( t ) {
            _controller.sink.add( _count );
            if( _count < 5 ) {
                _count++;
            }
        } );
    }



}