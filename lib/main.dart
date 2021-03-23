import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

//  void _incrementCounter() {
//    setState(() {
//
//      _counter++;
//    });
//  }

//  void _decrementCounter() {
//    setState(() {
//
//      _counter--;
//    });
//  }


  double _offerPercent = 0;
  double _productPrice = 25.0;

  void _incrementPercent() {
    setState(() {
      if (_offerPercent < 100.0) {
        _offerPercent++;
        _calcPriceAfterSale();
      }
    });
  }

  void _decrementPercent() {
    setState(() {
      if (_offerPercent > 0.0) {
        _offerPercent--;
        _calcPriceAfterSale();
      }
    });
  }

  double _calcPriceAfterSale ()=> _productPrice * (1 - _offerPercent / 100);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Current Product Price: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.greenAccent,fontSize: 15),

                  ),
                  Text(
                    '25.0 EG',
                    style: TextStyle(color: Colors.redAccent,fontSize: 15),
                  )
                ],

            ),
             SizedBox(height: 50,),
             Container(
               alignment: Alignment.centerLeft,
               padding: EdgeInsets.only(left: 20),
               child: Text(
                 'Set Offer the Product',
                 style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.right,
               ),
             ),
             SizedBox(height: 30,),
             Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed:  _incrementPercent,
                  child: Icon(Icons.add),
                  color: Colors.lightBlue,
                ),
                SizedBox(width: 40,),
                Text(
                  '$_offerPercent %',
                  style: Theme.of(context).textTheme.display1,
                ),
                SizedBox(width: 40,),
                RaisedButton(
                  onPressed:  _decrementPercent,
                  child: Icon(Icons.remove),
                  color: Colors.lightBlue,
                ),
              ],
            ),
            SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Price After Apply ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 15),

                  ),
                  Text(
                    '${_calcPriceAfterSale()} EG',
                    style: TextStyle(color: Colors.redAccent,fontSize: 15),
                  )
                ],
              ),


          ],

        )

      ),

    );
  }
}
