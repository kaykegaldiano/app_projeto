import 'package:app_projeto/telas/cadastrar.dart';
import 'package:app_projeto/telas/detalhes.dart';
import 'package:app_projeto/telas/noticias.dart';
import 'package:app_projeto/telas/recuper_senha.dart';
import 'package:app_projeto/telas/tela_sobre.dart';
import 'package:app_projeto/telas/tela_login.dart';
import 'package:flutter/material.dart';

void main() {
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
    },
  ),
  );
}