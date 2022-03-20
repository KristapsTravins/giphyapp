import 'dart:async';
import 'package:flutter/material.dart';
import 'package:giphy_task/app/functions/api.dart';
import 'package:http/http.dart' as http;

class GiffBlock extends StatefulWidget {
  const GiffBlock({Key? key}) : super(key: key);

  @override
  State<GiffBlock> createState() => _GiffBlockState();
}

class _GiffBlockState extends State<GiffBlock> {
  final myController = TextEditingController();

  final Api = ApiCall();

  List<Gif> links = [];

  Widget giffListBuilder() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: links.length,
        itemBuilder: (context, index) {
          return Container(
            height: double.parse(links[index].Height),
            child: Image.network(links[index].links, fit: BoxFit.fill),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: myController,
            onChanged: (text) {
              setState(() {
                setChange() async {
                  links = await Api.getGiffs(myController.text);
                }

                setChange();
              });
            },
            style: TextStyle(fontSize: 19.0, color: Colors.white),
            decoration: InputDecoration(
                labelText: "Search Giff here ...",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
          elevation: 2.0,
          actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
        ),
        body: giffListBuilder());
  }
}
