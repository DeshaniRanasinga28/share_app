import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description'
                  ),
                  maxLength: 100,
                  onChanged: (String value){
                    setState(() {
                      text = value;
                    });
                  }
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),

            Builder(
              builder: (BuildContext context){
                return RaisedButton(
                    child: const Text("Share"),
                    onPressed: text.isEmpty ? null :  () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(
                          text,
                          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
                      );
                    }
                );
              },
            )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
