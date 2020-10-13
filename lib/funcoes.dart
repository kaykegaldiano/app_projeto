import 'dart:io';
import 'package:flutter/material.dart';

//
// CAIXA DIALOGO
//
showAlertDialog(BuildContext context, msg) {
  // configura o botão
  Widget botaoSim = FlatButton(
    child: Text('Sim', style: TextStyle(color: Colors.red),),
    onPressed:() {
      exit(0);
    }, 
  );

  Widget botaoNao = FlatButton(
    child: Text('Não'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // configura o AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text('Aviso', style: TextStyle(fontSize: 16),),
    content: Text(msg, style: TextStyle(fontSize: 16),),
    actions: [
      botaoSim,
      botaoNao,
    ],
  );

  // exibe o dialogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    }
  );
}

  //
  // CAMPOS DE TEXTO
  //
  Widget campoTextoUser(rotulo, variavelControle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: variavelControle,
        style: TextStyle(fontSize: 18, color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: rotulo,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
        style: TextStyle(fontSize: 18, color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: rotulo,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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