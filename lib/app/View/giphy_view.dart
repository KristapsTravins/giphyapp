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

  List<String> links = [];

  Widget builds() {
    return GridView.count(
        crossAxisCount: 2,
        children: links
            .map((link) => Column(children: [
                  Image.network(
                    link,
                    fit: BoxFit.contain,
                  )
                ]))
            .toList());
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
                hintText: myController.text.isEmpty ? 'Search Giff ...' : '',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
          elevation: 2.0,
          actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
        ),
        body: builds());
  }
}
