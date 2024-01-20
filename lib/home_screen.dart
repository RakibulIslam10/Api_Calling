import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List MyData = [];

  getMyData() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    MyData = jsonDecode(response.body);
    setState(() {});

  }
  @override
  void initState() {
    getMyData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MyData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(MyData[index]["name"]),
            subtitle: Text(MyData[index]["email"]),
          );
        },
      ),
    );
  }
}
