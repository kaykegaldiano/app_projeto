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

  //
  // DETALHES
  //
  Widget noticia() {
    var title = 'Flutter 2020';
    var subtitle = 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...';
    var news = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' 
            'Donec lobortis mauris non pretium fermentum. Sed semper eros quis ultrices gravida.'
            'Sed vehicula quis lorem non fringilla. Duis a metus a enim finibus vulputate eu a nunc.'
            'Mauris blandit ligula in ornare vestibulum. Fusce tortor lorem, ultrices sit amet tortor'
            'id, tincidunt congue risus. Maecenas facilisis orci sed volutpat sodales.'
            'Nullam posuere ultricies justo, ut vestibulum purus volutpat nec. Mauris molestie in'
            'odio a ultricies. Duis tincidunt tincidunt accumsan. Fusce sed magna cursus,'
            'hendrerit ante eget, mollis turpis.';
            
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0,left: 30.0, right: 30.0),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 14),
            ),
        ),
        Divider(thickness: 2.0,),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(news, textAlign: TextAlign.justify,),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
            height: 200,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/logo.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Divider(thickness: 2.0,),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
        child: Text(
          'Mais Notícias: ',
          style: TextStyle(fontSize: 20,),
          textAlign: TextAlign.center,
          ),
      ),
    ],
  );
}