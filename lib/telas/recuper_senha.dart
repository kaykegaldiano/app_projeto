import 'dart:async';

import 'package:app_projeto/model/usuarios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecuperaSenha extends StatefulWidget {
  @override
  _RecuperaSenhaState createState() => _RecuperaSenhaState();
}

class _RecuperaSenhaState extends State<RecuperaSenha> {

  // Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40, left:40, right: 40),
        child: Form(
          key: formKey,
            child: Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                // child: Image.asset("assets/reset-password-icon.png"),
                child: Icon(
                  Icons.lock_open_rounded,
                  size: 120,
                  color: Colors.blue[500],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Esqueceu sua senha?",
                style: TextStyle(fontSize: 32,
                fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Por favor, informe o E-mail associado a sua conta para que possamos recuperar sua senha.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
      TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontSize: 20,
              fontWeight: FontWeight.w400
              ),
          ),
          controller: txtEmail,
          validator: (value) {
            if (value == null || value.isEmpty || value.contains(' ')) {
              return 'Campo vazio ou incorreto.';
            }
            return null;
          },
          style: TextStyle(fontSize: 20),
      ),
          SizedBox(
            height: 20,
          ),
          Container(
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
              borderRadius: BorderRadius.all(Radius.circular(5),),
            ),
            child: SizedBox.expand(
              // BOTÃO
              child: FlatButton(
                child: Text(
                  "Enviar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),

                onPressed: () {

                  String email = txtEmail.text;
                  bool validar = false;

                  if (formKey.currentState.validate()) {
                    setState(() {
                      usersList.forEach((element) {
                        if (email == element.email) {
                          validar = true;
                          caixaDialogo("A senha do e-mail $email é ${element.senha}");
                          //caixaDialogo("Um link de recuperação de senha foi enviado para o e-mail ${txtEmail.text}.\nPor favor verifique a Caixa de Entrada e/ou Spam.");
                        }
                      });

                      if (!validar) {
                        caixaDialogo("E-mail não cadastrado!");
                      }
                    });
                  }
                },
              ),
            ),
          ),
    SizedBox(
    height: 20,
              ),
            ],
          ),
        ),
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