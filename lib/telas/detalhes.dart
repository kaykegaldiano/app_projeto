import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(

          ),
        ],
      ),
    );
  }
}