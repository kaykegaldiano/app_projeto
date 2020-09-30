import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  // Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        child: Form(
          key: formKey,
            child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                alignment: Alignment(0.0, 1.15),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/profile-pic.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Container(
                  height: 56,
                  width: 56,
                  alignment: Alignment.center,
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
                    border: Border.all(
                      width: 4.0,
                      color: const Color(0xFFFFFFFF),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(56),),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                          Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
      TextFormField(
          // autofocus: true,
          controller: txtNome,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Nome",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo vazio';
            }
            return null;
          },
          style: TextStyle(fontSize: 20),
      ),
      SizedBox(
          height: 10
      ),
      TextFormField(
          controller: txtEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo vazio';
            }
            return null;
          },
          style: TextStyle(fontSize: 20),
      ),
      SizedBox(
          height: 10,
      ),
      TextFormField(
          controller: txtPass,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo vazio';
            }
            else if (value.length <= 3) {
              return 'Senha muito pequena!';
            }
            return null;
          },
          style: TextStyle(fontSize: 20),
      ),
      SizedBox(
          height: 10,
      ),
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
              child: Text("Cadastrar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              ),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  setState(() {
                    caixaDialogo("Um link com a confirmação de e-mail foi enviado no e-mail ${txtEmail.text}.\nFavor verificar a Caixa de Entrada e/ou Spam");
                  });
                }
              },
            ),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Container(
          height: 40,
          alignment: Alignment.center,
          child: FlatButton(
            child: Text(
              "Cancelar",
              textAlign: TextAlign.center,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
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
          title: Text("Aviso", style: TextStyle(fontSize: 16),),
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