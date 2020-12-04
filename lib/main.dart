import 'package:app_projeto/telas/adicionar_noticia.dart';
import 'package:app_projeto/telas/cadastrar.dart';
import 'package:app_projeto/telas/detalhes.dart';
import 'package:app_projeto/telas/tela_noticias.dart';
import 'package:app_projeto/telas/recuper_senha.dart';
import 'package:app_projeto/telas/tela_sobre.dart';
import 'package:app_projeto/telas/tela_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Projeto App',
    theme: ThemeData(
      primaryColor: Colors.blue[900],
      backgroundColor: Colors.white,
      // backgroundColor: Colors.grey[400],
      fontFamily: 'Roboto',
    ),

    initialRoute: '/telas/tela_login',
    routes: {
      '/telas/tela_login': (context) => TelaLogin(),
      '/telas/tela_sobre': (context) => Tela01(),
      '/telas/recuper_senha': (context) => RecuperaSenha(),
      '/telas/cadastrar': (context) => TelaCadastro(),
      '/telas/noticias': (context) => Noticias(),
      '/telas/detalhes': (context) => Detalhes(),
      '/telas/adicionar_noticia': (context) => AdicionarNoticia(),
    },
  ),
  );
}