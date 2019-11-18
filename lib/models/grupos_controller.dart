import 'dart:convert';
import 'grupos.dart';
import 'package:http/http.dart' as http;

//const url = 'http://web/api/grupos';
const url = "http://192.168.0.3/wseletrosin/api/ordem/cliente/11";

class GruposController {
  static Future<List<Grupo>> getGrupos() async {
    http.Response response = await http.get(url);
    Map<String, dynamic> o = jsonDecode(response.body);
    List<Map<String, dynamic>> grupos =
        new List<Map<String, dynamic>>.from(o["dados"]);

    return grupos.map((x) => Grupo.fromMap(x)).toList();
  }
}
