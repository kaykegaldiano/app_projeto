import 'dart:async';

import 'package:app_projeto/model/noticias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {

var db = FirebaseFirestore.instance;

List<News> detalhes = List();

StreamSubscription<QuerySnapshot> listener;

@override
void initState() {
  super.initState();

  listener?.cancel();

  listener = db.collection("noticias").snapshots().listen((res) {

    setState(() {
      detalhes = res.docs.map((e) => News.fromMap(e.data(), e.id)).toList();
    });
   });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ]
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("noticias").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no FireBase"),);
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
          default: return ListView.builder(
            itemCount: detalhes.length, 
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  detalhes[index].titulo,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
          padding: const EdgeInsets.only(top: 5.0,left: 30.0, right: 30.0),
          child: Text(
            detalhes[index].subtitulo,
            style: TextStyle(fontSize: 14),
            ),
        ),
        Divider(thickness: 2.0,),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(detalhes[index].descricao, textAlign: TextAlign.justify,),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
            height: 200,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/logo.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Divider(thickness: 2.0,),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
        child: Text(
          'Mais Notícias: ',
          style: TextStyle(fontSize: 20,),
          textAlign: TextAlign.center,
          ),
      ),
      Divider(thickness: 2.0,),
            ],
          );
        },
      );
    }
  }
),
        
      );
  }
}