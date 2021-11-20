import 'package:flutter/material.dart';
import 'package:todowithlist/Networking/Service.dart';
import 'package:todowithlist/Networking/Models/Todo.dart';

class InsertForm extends StatefulWidget {
  @override
  _InsertForm createState() {
    return _InsertForm();
  }
}

class _InsertForm extends State<InsertForm> {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  Service service = Service();
  late bool status;
  var result;
  @override
  void initState() {
    status = false;
    super.initState();
  }

  checkResult(bool result) {
    if (result == true) {
      setState(() {
        status = false;
        title.text = '';
        message.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Submit form'),
          centerTitle: true,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 14),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: title,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter the Title',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black12))),
                  cursorHeight: 4,
                ),
                Divider(
                  height: 24,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: message,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter the Message',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black12))),
                  cursorHeight: 4,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(14)),
                  child: FlatButton(
                    onPressed: () async {
                      Todo todo =
                          Todo(id: 4, title: title.text, message: message.text);
                      setState(() {
                        status = true;
                      });
                      result = await service.sentData(todo);
                      checkResult(result);
                    },
                    child: Text(
                      status ? 'Sending data.....' : 'insert data',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/view');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 80),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.redAccent),
                    child: Center(
                        child: Text(
                      'View all Data',
                      style: TextStyle(fontSize: 21),
                    )),
                  ),
                )
              ],
            )),
      );
}
