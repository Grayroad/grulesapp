import 'grupos.dart';

class Evento {
  DateTime dataInclusao;
  DateTime dataInicio;
  DateTime dataTermino;
  String descricao;
  int idEvento;
  List<Grupo> grupos;

  static Evento fromMap(Map<String, dynamic> map) {
    Evento evento = Evento();
    evento.dataInclusao = map["DataInclusao"];
    evento.dataInicio = map["DataInicio"];
    evento.dataTermino = map["DataTermino"];
    evento.descricao = map["Descricao"];
    evento.idEvento = map["IdEvento"];
    evento.grupos = (map["Grupos"] as List<Map<String, dynamic>>)
      .map((x) => Grupo.fromMap(x))
      .toList();

    return evento;
  }

  Map<String, dynamic> toMap() {
    return {
      "DataInclusao": dataInclusao,
      "DataInicio": dataInicio,
      "DataTermino": dataTermino,
      "Descricao": descricao,
      "IdEvento": idEvento,
      "Grupos": grupos
    };
  }
}
