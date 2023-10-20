import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing_app/loadstringhelper/loadstring_helper.dart';

import '../../model/student_model.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late Future<List<StudentModel>> alldata;

  @override
  void initState() {
    alldata = LoadStringHelper.loadStringHelper.loadJson();
    print(alldata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: FutureBuilder(
          future: alldata,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR:${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<StudentModel>? data = snapshot.data;

              if (data == null) {
                return const Text("No data Available...");
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(data[i].name),
                        leading: Text("${data[i].id}"),
                        subtitle: Text("${data[i].course}"),
                        trailing: Text("Age :${data[i].age}"),
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
