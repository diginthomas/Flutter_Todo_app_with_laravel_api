import 'package:flutter/material.dart';
import 'package:todowithlist/Networking/Service.dart';

class View extends StatefulWidget {
  @override
  _View createState() {
    return _View();
  }
}

class _View extends State<View> {
  Service service = Service();
  Future<List> check() async {
    List<String> data = ['hello', 'hai', 'ggg', 'hhhh', 'ff'];
    return Future.delayed(Duration(seconds: 4), () => data);
  }

  @override
  Widget build(BuildContext context) {
    //service.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: FutureBuilder(
            future: service.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].message),
                      leading: Text((index + 1).toString()),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              print(snapshot.data[index].id);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),

                          ),
                         IconButton(
                            onPressed: () async{
                              setState(() {
                               service.deleteData(snapshot.data[index].id);
                              });

                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                          ),
                        ],
                      )),
                );
              }
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.redAccent,
              ));
            }),
      ),
    );
  }
}
