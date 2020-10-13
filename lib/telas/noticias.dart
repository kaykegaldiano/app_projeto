import 'package:app_projeto/funcoes.dart';
import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {

  var items = List<String>();

  @override
  void initState() {
    items.add("Flutter 2020");
    items.add("Flutter 2020");
    items.add("Flutter 2020");
    items.add("Flutter 2020");
    items.add("Flutter 2020");
    super.initState();
  }
  Widget build(BuildContext context) {

    //
    // RECUPERAR OS DADOS DA TELA PRINCIPAL
    //
    Map dados = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notícias'),
        centerTitle: true,
      ),
      // backgroundColor: Colors.blue,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
                  image: AssetImage('assets/logo.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              accountName: Text(
                "Bem-vindo, ${dados['user']}!",
                style: TextStyle(color: Colors.white,),
                ),
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
              leading: Icon(Icons.announcement),
              title: Text('Sobre'),
              subtitle: Text('Sobre o aplicativo'),
              onTap: () {
                Navigator.pushNamed(context, '/telas/tela_sobre', arguments: dados);
              },
            ),
            Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
          // indent: 20,
          endIndent: 0,
        ),
        ListTile(
          leading: Icon(Icons.supervised_user_circle),
          title: Text('Fazer Log off'),
          subtitle: Text('Voltar para a tela de login'),
          onTap: () {
            Navigator.pushNamed(context, '/telas/tela_login');
          },
        ),
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            endIndent: 0,
          ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              subtitle: Text('Sair do aplicativo'),
              onTap: () {
                showAlertDialog(context, 'Deseja realmente sair do aplicativo?');
              },
            ),
          ],
        ),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                // side: BorderSide(
                //   color: Colors.black,
                // ),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 10,
              borderOnForeground: false,
              color: Colors.grey[100],
              child: Container(
                // padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Divider(color: Colors.transparent),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        items[index], maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                        ),
                    ),
                    // ListTile(
                    //   title: Text('Titulo'),
                    //   leading: Icon(Icons.home),
                    // ),
                    Divider(color: Colors.transparent),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
                      'Donec lobortis mauris non pretium fermentum. Sed semper eros quis ultrices gravida.'
                      'Sed vehicula quis lorem non fringilla. Duis a metus a enim finibus vulputate eu a nunc.'
                      'Mauris blandit ligula in ornare vestibulum. Fusce tortor lorem, ultrices sit amet tortor'
                      'id, tincidunt congue risus. Maecenas facilisis orci sed volutpat sodales.'
                      'Nullam posuere ultricies justo, ut vestibulum purus volutpat nec. Mauris molestie in'
                      'odio a ultricies. Duis tincidunt tincidunt accumsan. Fusce sed magna cursus,'
                      'hendrerit ante eget, mollis turpis.',
                      style: TextStyle(fontSize: 14),maxLines: 3,textAlign: TextAlign.justify,),
                    ),

                      ButtonBarTheme(
                        data: ButtonBarThemeData(
                          alignment: MainAxisAlignment.end,
                        ),
                        child: ButtonBar(
                          children: [
                            FlatButton(
                              child: const Text('DETALHES'),
                              onPressed: (){
                                Navigator.pushNamed(context, '/telas/detalhes', arguments: dados);
                              },
                            ),
                            // FlatButton(
                            //   child: Text('SHARE'),
                            //   onPressed: (){},
                            // ),
                            IconButton(
                            icon: Icon(Icons.share_outlined),
                            onPressed: (){},
                            color: Colors.blue
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
