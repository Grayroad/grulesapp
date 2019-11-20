import 'dart:convert';
import 'controller.dart';

import 'eventos.dart';

import 'package:http/http.dart' as http;

//const url = 'http://web/api/grupos';
const url = "eventos/";

class EventoController {
  static Future<List<Evento>> getEventos() async {
    http.Response response = await http.get(Controller.urlBase + url);
    Map<String, dynamic> o = jsonDecode(response.body);
    List<Map<String, dynamic>> eventos =
        new List<Map<String, dynamic>>.from(o["dados"]);

    // Evento evento1 = Evento();
    // evento1.idEvento = 1;
    // evento1.descricao = "Grules 2019/1";
    // evento1.dataInicio = DateTime.parse("2019-01-27 18:40");
    // evento1.dataTermino = DateTime.parse("2019-01-28 20:30");
    // Evento evento2 = Evento();
    // evento2.idEvento = 2;
    // evento2.descricao = "Grules 2019/2";
    // evento2.dataInicio = DateTime.parse("2019-05-27 18:40");
    // evento2.dataTermino = DateTime.parse("2019-05-28 20:30");
    // List<Map<String, dynamic>> eventos = [evento1.toMap(), evento2.toMap()];
    return eventos.map((x) => Evento.fromMap(x)).toList();
  }
}
