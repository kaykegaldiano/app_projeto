class DetalhesNews {
  String _id;
  String _titulo;
  String _subtitulo;
  String _descricao;

  DetalhesNews(this._id, this._titulo, this._subtitulo, this._descricao);

  String get id => _id;
  String get titulo => _titulo;
  String get subtitulo => _subtitulo;
  String get descricao => _descricao;

  DetalhesNews.map(dynamic obj) {
    this._id = obj['id'];
    this._titulo = obj['titulo'];
    this._subtitulo = obj['subtitulo'];
    this._descricao = obj['descricao'];
  }

  // Converter os dados para um mapa
  Map<String, dynamic>toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['titulo'] = _titulo;
    map['subtitulo'] = _subtitulo;
    map['descricao'] = _descricao;
    return map;
  }

  // Converter um DOCUMENTO em OBJETO
  DetalhesNews.fromMap(Map<String, dynamic>map, String id) {
    // Se o parâmetro id != null, então this.id = id,
    // Senão, this.id = '';
    this._id = id ?? '';
    this._titulo = map['titulo'];
    this._subtitulo = map['subtitulo'];
    this._descricao = map['descricao'];
  }
}