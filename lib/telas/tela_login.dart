import 'dart:async';

import 'package:app_projeto/model/usuarios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../funcoes.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  // Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  // Armazenar valores do user e pass
  TextEditingController txtName = TextEditingController();
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  var db = FirebaseFirestore.instance;

  // Lista Dinâmica de objetos da classe Usuarios
  List<Usuarios> usersList = List();


  // Declaração de um objeto "ouvinte" da coleção  usuarios do Firestore
  StreamSubscription<QuerySnapshot> listener;

  @override
  void initState() {
    super.initState();

    //cancelar o ouvidor, caso a coleção esteja vazia.
    listener?.cancel();

    listener = db.collection("usuarios").snapshots().listen((res) {

      setState(() {
      usersList = res.docs.map((e) => Usuarios.fromMap(e.data(), e.id)).toList();

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.amber,

      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("usuarios").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no FireBase"),);
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
          default: return SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          height: 700,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/bg.jpeg'),
              image: AssetImage('assets/bg1.png'),
              colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      // fit: BoxFit.fill,
                      image: AssetImage('assets/logo.jpeg'),
                  // Image.asset('assets/logo.jpeg', width: 200, height: 200,)
                    ),
                  ),
                  ),
                // Icon(
                //   Icons.login,
                //   size: 120,
                //   color: Theme.of(context).primaryColor,
                //   ),

                  campoTextoUser("E-mail", txtUser),
                  campoTextoPass("Senha", txtPass),
                  forgotPass("Recuperar Senha"),
                  SizedBox(
                    height: 40,
                  ),
                  botaoLogin("Login"),
                  SizedBox(
                    height: 10,
                  ),
                  botaoCadastro("Cadastre-se"),
              ],
            )
          ),
        ),

          );
        }
        }
      )
    );
  }

  //
  // BOTÃO LOGIN
  //
  Widget botaoLogin(rotulo) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            Colors.blue,
            Colors.blueGrey,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: SizedBox.expand(
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(rotulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                ),
                textAlign: TextAlign.left,
            ),
            Container(
              child: SizedBox(
                child: Icon(Icons.login),
              ),
            ),
          ],
          ),
        onPressed: () {

          String email = txtUser.text;
          String senha = txtPass.text;
          String nome = txtName.text;

          bool validar = false;

          debugPrint('listaDeUsuarios: $usersList');

          if (formKey.currentState.validate()) {
            setState(() {

            usersList.forEach((element) {
              if (email == element.email && senha == element.senha) {
                nome = element.nome;
                validar = true;
              }
            });
            
            if (validar) {
            var dados = Map();
            dados['user'] = nome;
            dados['email'] = email;
            Navigator.pushNamed(context, '/telas/tela_sobre', arguments: dados);
            }
            else {
              caixaDialogo("Usuário / Senha incorreto ou inexistente!");
            }


            });
          }
        },
      ),
      ),
    );
  }
  //
  // BOTÃO RECUPERAR SENHA
  //
    Widget forgotPass(rotulo) {
    return Container(
      height: 40,
      alignment: Alignment.centerRight,
      // padding: EdgeInsets.only(top: 40),
      child: FlatButton(
        child: Text(rotulo, style: TextStyle(color: Colors.white),
        ),
        color: Colors.transparent,
        onPressed: () {
          //  debugPrint("esqueceu a senha???");

          Navigator.pushNamed(context, '/telas/recuper_senha');
        },
      ),
    );
  }

  //
  // BOTAO CADASTRO
  //
  Widget botaoCadastro(rotulo) {
    return Container(
      height: 40,
      child: FlatButton(
        child: Text(
          rotulo,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/telas/cadastrar');
        },
      ),
    );
  }

  //
  // CAIXA DE DIALOGO
  //
  caixaDialogo(msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso", style: TextStyle(fontSize: 16, color: Colors.red,)),
          content: Text(msg, style: TextStyle(fontSize: 16)),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                },
                child: Text('Entendi'),
            )
          ],
        );
      }
      );
  }
}