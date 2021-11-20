import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todowithlist/Networking/Models/Todo.dart';

const url = 'http://192.168.1.9:80/api';

class Service {
  Future<bool> sentData(Todo todo) async {
    var data = jsonEncode(todo);
    var result = await http.post(Uri.parse('$url/insert'),
        headers: {'Content-Type': 'application/json'},
        body: data,
        encoding: Encoding.getByName("utf-8"));
    if (result.statusCode == 200) {
      print(result.body);
      print('created');
      return true;
    } else {
      print(result.statusCode);
      return false;
    }
  }

  // List<ListTile> getList() {
  //   int index=0;
  //    Todo d;
  //    var data= getData();
  //    for(d in data){
  // }

  Future<List<Todo>> getData() async {
    List<Todo> alldata = [];
    int index = 0;
    var result = await http.get(Uri.parse('$url/show'));
    print(result.statusCode);
    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);

      for (index = 0; index < data.length; index++) {
        Todo element = Todo(
            id: data[index]['id'],
            title: data[index]['title'],
            message: data[index]['message']);
        alldata.add(element);
      }
    }
    return alldata;
  }
  Future<void> deleteData(int id) async{
    var result = await http.get(Uri.parse('$url/delete/$id'));
    print(result.statusCode);


    }
}
// for(index=0; index<data.length;index++){
//   print(data[index]['message']);
// }
// ListTile tile = ListTile(
//   title: Text(data[index]['title']),
//   subtitle: Text(data[index]['message']),
//   tileColor: Colors.black12,
// );
