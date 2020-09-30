import 'package:flutter/material.dart';

class Tela01 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    //
    // RECUPERAR OS DADOS DA TELA PRINCIPAL
    //
    Map dados = ModalRoute.of(context).settings.arguments;
    // String user;

    // if (dados != null) {
    //   user = dados['user'].text;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Bem-vindo, ${dados['user']}!"),
              accountEmail: null, //Text("kaykegaldiano@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage(
                  "https://instagram.fcgh14-1.fna.fbcdn.net/v/t51.2885-19/s150x150/93767281_938085866625167_5632983925216247808_n.jpg?_nc_ht=instagram.fcgh14-1.fna.fbcdn.net&_nc_ohc=bQgOwwpnM9AAX_ILt8a&oh=218691797ec6c18f8212ea8b2ce31431&oe=5F95E96C"
                  ),
                  backgroundColor: Colors.transparent,
              ),
              ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
          color: Colors.black,
          height: 1,
          thickness: 1,
          // indent: 20,
          endIndent: 0,
        ),
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                // debugPrint("é ué");
                Navigator.pushNamed(context, '/telas/tela_login');
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
          Text("Seja bem-vindo ao meu aplicativo! Nele eu abordarei o tema de {tema}.\n"
          "O objetivo dele é {objetivo}.",
          style: TextStyle(fontSize: 30),
          ),
          Container(
            
          ),
          ],
        ),
      ),
    );
  }
}