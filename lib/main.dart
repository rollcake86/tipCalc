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
      home: MyHomePage(title: 'Simple Calculator'),
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
  var tipResult = "";

  TextEditingController controller = new TextEditingController();
  TextEditingController tipController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(15.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: '원래 비용',
                    hintText: '비용을 입력하세요',
                    prefixIcon: new Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                controller: controller,
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(15.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Tip',
                    hintText: '팁 %를 입력하세요',
                    prefixIcon: new Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                controller: tipController,
              ),
            ),
            new Text('총 가격 : $tipResult ')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tipCalc,
        tooltip: 'tip calc',
        child: Icon(Icons.monetization_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _tipCalc() {
    if (controller.text.length == 0) {
      return;
    }
    if (tipController.text.length == 0) {
      return;
    }

    setState(() {
      int money = int.parse(controller.text);
      int tip = int.parse(tipController.text);
      print(money);
      print(tip);

      var result = money + (money * (tip / 100));
      print((money * (tip / 100)));
      tipResult = result.toString();
    });
  }
}
