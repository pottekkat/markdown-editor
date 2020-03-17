import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdown Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  TextEditingController _textEditingController;
  String text = "";
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Markdown Editor",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.poll,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Input Markdown Text"),
            onChanged: (String text) {
              setState(() {
                this.text = text;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Markdown(data: text),
        ),
      ]),
    );
  }
}
