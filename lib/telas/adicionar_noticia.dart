import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdicionarNoticia extends StatefulWidget {
  @override
  _AdicionarNoticiaState createState() => _AdicionarNoticiaState();
}

class _AdicionarNoticiaState extends State<AdicionarNoticia> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  var db = FirebaseFirestore.instance;

  // Recuperar um DOCUMENTO a partir do ID
  void getDocumentById(String id) async {
    await db.collection("noticias").doc(id).get().then((doc) {

      txtTitulo.text = doc.data()['titulo'];
      txtSubtitulo.text = doc.data()['subtitulo'];
      txtDescricao.text = doc.data()['descricao'];
    });
  }

  @override
  Widget build(BuildContext context) {
  final String id = ModalRoute.of(context).settings.arguments;

  if (id != null) {
      if (txtTitulo.text == '' && txtSubtitulo.text == '' && txtDescricao.text == '') {
        getDocumentById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            //TITULO
            TextField(
              controller: txtTitulo,
              style:
              TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Título",
              ),
            ),
            SizedBox(height: 20),

            //SUBTITULO
            TextField(
              controller: txtSubtitulo,
              style:
              TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Subtitulo",
              ),
            ),
            SizedBox(height: 20),

            //DESCRIÇÃO
            TextField(
              controller: txtDescricao,
              style:
              TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            SizedBox(height: 30),

            //BOTÕES
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 20,)),
                    onPressed: () async{
                      if (id == null) {
                        // ADICIONAR um novo DOCUMENTO a COLEÇÃO
                        await db.collection("noticias").add(
                          {
                            "titulo": txtTitulo.text,
                            "subtitulo": txtSubtitulo.text,
                            "descricao": txtDescricao.text,
                          }
                        );
                      }
                      else {
                        //ATUALIZAR DADOS DO DOCUMENTO
                        await db.collection("noticias").doc(id).update(
                          {
                            "titulo": txtTitulo.text,
                            "subtitulo": txtSubtitulo.text,
                            "descricao": txtDescricao.text,
                          }
                        );
                      }
                      Navigator.pop(context);
                    }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}