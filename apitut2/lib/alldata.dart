import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllData extends StatefulWidget {
  const AllData({super.key});

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  Map stringResponse = {};
  Map stringResponse2 = {};
  List listResponse = [];
  Future apicall() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = json.decode(response.body);
        listResponse = stringResponse["data"];

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("API Demo")),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              
              child: Column(children: [
                Image.network(listResponse[index]["avatar"]),
                Text(listResponse[index]["id"].toString()),
                Text(listResponse[index]["email"].toString()),
                Text(listResponse[index]["first_name"].toString()),
                Text(listResponse[index]["last_name"].toString()),
              ]),
              color: Color.fromARGB(255, 108, 182, 222),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse.length,
        ));
  }
}
