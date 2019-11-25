import 'dart:convert';
import 'aluno.dart';
import 'controller.dart';

import 'eventos.dart';

import 'package:http/http.dart' as http;

import 'grupos.dart';

//const url = 'http://web/api/grupos';
const url = "evento/";

class EventoController {
  static Future<List<Evento>> getEventos() async {
    // http.Response response = await http.get(Controller.urlBase + url);
    // List<Map<String, dynamic>> o = jsonDecode(response.body);
    // List<Map<String, dynamic>> eventos =
    //     new List<Map<String, dynamic>>.from(o);
    //return eventos.map((x) => Evento.fromMap(x)).toList();
    
    Aluno aluno1 = Aluno();
    aluno1.idAluno = 1;
    aluno1.matricula = "00001";
    aluno1.nome = "Eduardo";
    aluno1.sobrenome = "Soler";
    
    Aluno aluno2 = Aluno();
    aluno2.idAluno = 2;
    aluno2.matricula = "00002";
    aluno2.nome = "Thayrone";
    aluno2.sobrenome = "Batista";

    Grupo grupo1 = Grupo();
    grupo1.idEvento = 1;
    grupo1.idGrupo = 1;
    grupo1.titulo = "Lorem Ipsum";
    grupo1.alunos = [aluno1];
    grupo1.descricao =
        """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s""";

    Grupo grupo2 = Grupo();
    grupo2.idEvento = 1;
    grupo2.idGrupo = 2;
    grupo2.titulo = "Programadores - Ódio incondicional";
    grupo2.alunos = [aluno1, aluno2];
    grupo2.descricao =
        """Programadores cada vez mais não se dão bem com usuários, o intelecto superior se torna impaciente ao comparado ao asno. Só que o ódio não para aí, programadores se tornaram incompatíveis com tudo que é gente""";

    Evento evento1 = Evento();
    evento1.idEvento = 1;
    evento1.descricao = "Grules 2019/1";
    evento1.dataInicio = DateTime.parse("2019-01-27 18:40");
    evento1.dataTermino = DateTime.parse("2019-01-28 20:30");
    evento1.grupos = [grupo1];

    Evento evento2 = Evento();
    evento2.idEvento = 2;
    evento2.descricao = "Grules 2019/2";
    evento2.dataInicio = DateTime.parse("2019-05-27 18:40");
    evento2.dataTermino = DateTime.parse("2019-05-28 20:30");
    evento2.grupos = [grupo1, grupo2];
    // List<Map<String, dynamic>> eventos = [evento1.toMap(), evento2.toMap()];
    
    return [ evento1, evento2 ];
  }
}
