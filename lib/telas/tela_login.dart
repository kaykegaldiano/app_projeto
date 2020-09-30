import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  // Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  // Armazenar valores do user e pass
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.amber,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.login,
                  size: 120,
                  color: Theme.of(context).primaryColor,
                  ),

                  campoTextoUser("Usuário", txtUser),
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
        )
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  Widget campoTextoUser(rotulo, variavelControle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: variavelControle,
        style: TextStyle(fontSize: 18),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || value.contains(' ')) {
            return 'Usuário vazio ou incorreto!';
          }
          return null;
        },
      ),
    );
  }

  Widget campoTextoPass(rotulo, variavelControle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: variavelControle,
        obscureText: true,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Senha vazia ou incorreta!';
          }
          // Senha precisa ser no mínimo de 4 caracteres
          else if (value.length <= 3) {
            return 'Senha muito pequena!';
          }
          return null;
        },
      ),
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
          if (formKey.currentState.validate()) {
            setState(() {
            // String user = txtUser.text;
            var dados = Map();
            dados['user'] = txtUser.text;
            Navigator.pushNamed(context, '/telas/tela_sobre', arguments: dados);

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
        child: Text(rotulo, style: TextStyle(color: Colors.black),
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
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/telas/cadastrar');
        },
      ),
    );
  }
}