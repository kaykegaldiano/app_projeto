import 'package:app_projeto/funcoes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Tela01 extends StatefulWidget {
  @override
  _Tela01State createState() => _Tela01State();
}

class _Tela01State extends State<Tela01> {

  @override
  Widget build(BuildContext context) {

    //
    // RECUPERAR OS DADOS DA TELA PRINCIPAL
    //
    Map dados = ModalRoute.of(context).settings.arguments;

    _callFacebook() async {
  var fbProtocolUrl = "fb://profile/100003909031205";
  var fallbackUrl = "https://www.facebook.com/kayke.galdiano/";
  
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

    _callGitHub() async {
      const gitHub = 'https://github.com/kaykegaldiano';
      if (await canLaunch(gitHub)) {
        await launch(gitHub, forceSafariVC: false);
      } else {
        throw 'Não foi possível acessar o $gitHub';
      }
    }

    _callLinkedin() async {
      const linkedin = 'https://www.linkedin.com/in/kayke-g-a83b13113/';
      if (await canLaunch(linkedin)) {
        await launch(linkedin, forceSafariVC: false);
      } else {
        throw 'Não foi possível acessar o $linkedin';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
      ),

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
              accountEmail: Text(dados['email']), //Text("kaykegaldiano@gmail.com"),
              /*currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage(
                  "https://instagram.fcgh14-1.fna.fbcdn.net/v/t51.2885-19/s150x150/93767281_938085866625167_5632983925216247808_n.jpg?_nc_ht=instagram.fcgh14-1.fna.fbcdn.net&_nc_ohc=bQgOwwpnM9AAX_ILt8a&oh=218691797ec6c18f8212ea8b2ce31431&oe=5F95E96C"
                  ),
                  backgroundColor: Colors.transparent,
              ),*/
              ),
              ListTile(
              leading: Icon(Icons.new_releases_rounded),
              title: Text('Notícias'),
              subtitle: Text('Ir para a página de notícias'),
              onTap: () {
                Navigator.pushNamed(context, '/telas/noticias', arguments: dados);
              },
            ),
            Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
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
                // debugPrint("é ué");
                  showAlertDialog(context, 'Deseja realmente sair do aplicativo?');
              },
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: ListView(
          children: [
          Text("Seja bem-vindo ao meu aplicativo!\nNele eu abordarei o tema de notícias de tecnologia.\n"
          "O objetivo dele é simular um app com notícias diárias relacionadas ao mundo da tecnologia.",
          style: TextStyle(fontSize: 30),textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20,),
          Text("Desenvolvedor: ", style: TextStyle(fontSize: 30),),
          SizedBox(height: 10,),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            backgroundImage: AssetImage('assets/desenv_foto.jpg'),
            radius: 150.0,
          ),
          SizedBox(height: 10,),
          Text(
            'Kayke Galdiano', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: _callFacebook,
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: _callLinkedin,
                ),
                IconButton(icon: FaIcon(FontAwesomeIcons.github), onPressed: _callGitHub,)
              ],
            ),
            SizedBox(height: 10),
            Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1.0],
              colors: [
                Colors.blue,
                Colors.blueGrey,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5),),
          ),
          child: SizedBox.expand(
            child: FlatButton(
              child: Text("Ver notícias",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/telas/noticias', arguments: dados);
              },
            ),
          ),
      ),
      SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}