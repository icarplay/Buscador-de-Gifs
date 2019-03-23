import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  int _offset = 0;

  String urlTrending = "https://api.giphy.com/v1/gifs/trending?api_key=Op6EDzD1BHzYO8I9DwLEuVZE8Q7TbOBr&limit=20&rating=G";

  String urlSearch = "https://api.giphy.com/v1/gifs/search?api_key=Op6EDzD1BHzYO8I9DwLEuVZE8Q7TbOBr&q=$_search&limit=20&offset=$_offset&rating=G&lang=en";

  Future<Map> _getSearchGif() async {
    http.Response response;

    if (_search == null){
      response = await http.get(urlTrending);
    } else {
      response = await http.get(urlSearch);
    }

    return json.decode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise aqui!",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          
        ],
      ),
    );
  }
}