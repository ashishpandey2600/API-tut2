import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int stringResponse = 0;
  Map mapResponse = {};
  Map insideDataMapMapResponse = {};
  Map foronlysupport = {};
  List<dynamic> listTesponse = [{}];
  Future apicall() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listTesponse = mapResponse['data'];

        stringResponse = mapResponse['total'];
        foronlysupport = listTesponse[0];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Demo")),
      body: Center(
          child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        child: Center(
            child: foronlysupport == null
                ? Text("Data is loading")
                : Text(foronlysupport['id'].toString())),
      )),
    );
  }
}
