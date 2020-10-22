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
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.amber,

      body: SingleChildScrollView(
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
        ),
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
}