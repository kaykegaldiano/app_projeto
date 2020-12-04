class Usuarios {

  String _id;
  String _nome;
  String _email;
  String _senha;

  Usuarios(this._id, this._nome, this._email, this._senha);

  String get id => _id;
  String get nome => _nome;
  String get senha => _senha;
  String get email => _email;

  Usuarios.map(dynamic obj) {
    this._id = obj['id'];
    this._nome = obj['nome'];
    this._senha = obj['senha'];
    this._email = obj['email'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["nome"] = _nome;
    map["senha"] = _senha;
    map["email"] = _email;
    return map;
  }

  // Converter um DOCUMENTO em OBJETO

  Usuarios.fromMap(Map<String, dynamic>map, String id) {
    // Se o parâmetro id != null, então this.id = id,
    // Senão, this.id = '';
    this._id = id ?? '';
    this._nome = map['nome'];
    this._senha = map['senha'];
    this._email = map['email'];
    
  }
}