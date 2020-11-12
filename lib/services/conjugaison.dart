import 'package:flutter/material.dart';
import 'dart:convert';

class Conjugaison extends StatefulWidget {
  Conjugaison({this.assettoload});
  final String assettoload;
  @override
  _ConjugaisonState createState() => _ConjugaisonState();
}

class _ConjugaisonState extends State<Conjugaison> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString(widget.assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        return Column(
          children: [
            Text(mydata[0]["1"]["phrase"].toString()),
            Text(mydata[1]["1"].toString()),
            //Text(mydata[2].toString()),
          ],
        );
      },
    );
  }
}
