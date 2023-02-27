import 'package:flutter/material.dart';
import 'package:shared1/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ok extends StatefulWidget {
  static  const String id="view";
  @override
  State<ok> createState() => _okState();
}

class _okState extends State<ok> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnote();
  }

  static String? note;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text("sddsffds"),),
      body: SafeArea(
        child: Center(
          child:Column(
            children: [
              note==null? Text("Note yeat"):Text(note!),
              SizedBox(height: 10,),
              Text(args.title)
            ],
          ),
        ),
      ),
    );
  }
   getnote() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      note=sp.getString("name");
    });
  }
}


