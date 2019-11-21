import 'package:grulesapp/models/aluno.dart';

class Grupo {
  int idGrupo;
  int idEvento;
  String titulo;
  String descricao;
  List<Aluno> alunos;

  static Grupo fromMap(Map map) {
    Grupo grupo = Grupo();
    grupo.idGrupo = map["IdGrupo"];
    grupo.idEvento = map["IdEvento"];
    grupo.titulo = map["Titulo"];
    grupo.descricao = map["Descricao"];
    grupo.alunos = (map["alunos"] as List<Map<String, dynamic>>)
                      .map((x) => Aluno.fromMap(x))
                      .toList();

    return grupo;
  }

  Map<String, dynamic> toMap() {
    return {
      "IdGrupo": idGrupo,
      "IdEvento": idEvento,
      "Titulo": titulo,
      "Descricao": descricao
    };
  }
}
