import 'package:shared1/home_page/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared preferances"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter the Data",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setnote(controller.text);
                  print(controller.text);
                },
                child: Text("Save")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,"ok" ,arguments:ScreenArguments(
                      controller.text
                  ) );
                  print("jimmt");
                  print(controller.text);
                },
                child: Text("View Data"))
          ],
        ),
      ),
    );
  }

  Future<void> setnote(notevalue) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("name", notevalue);
  }
}
class ScreenArguments {
  final  String title;
  ScreenArguments(this.title);
}
