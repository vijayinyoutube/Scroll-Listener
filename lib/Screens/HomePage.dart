import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier message ;
  ScrollController _controller;
  ValueNotifier message1;

  _scrollListener() {
    if (_controller.offset.ceil() >= _controller.position.maxScrollExtent) {
      print("hai");
      setState(() {
        message.value = "ASASASA";
      });
    }
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message.value = "All caught up 🎉";
      });
    } else {
      setState(() {
        message.value = "";
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll View"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              physics: BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(title: Text("Index : $index"));
              },
            ),
          ),
          ValueListenableBuilder<String>(
              valueListenable: message.value,
              builder: (context, value, _) {
                return Text(message.value.toString());
              }),
        ],
      ),
    );
  }
}
