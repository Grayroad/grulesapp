class Evento {
  DateTime dataInclusao;
  DateTime dataInicio;
  DateTime dataTermino;
  String descricao;
  int idEvento;

  static Evento fromMap(Map<String, dynamic> map) {
    Evento evento = Evento();
    evento.dataInclusao = map["DataInclusao"];
    evento.dataInicio = map["DataInicio"];
    evento.dataTermino = map["DataTermino"];
    evento.descricao = map["Descricao"];
    evento.idEvento = map["IdEvento"];

    return evento;
  }

  Map<String, dynamic> toMap() {
    return {
      "DataInclusao": dataInclusao,
      "DataInicio": dataInicio,
      "DataTermino": dataTermino,
      "Descricao": descricao,
      "IdEvento": idEvento
    };
  }
}
