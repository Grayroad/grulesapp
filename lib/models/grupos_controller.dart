import 'dart:convert';
import 'controller.dart';
import 'grupos.dart';
import 'package:http/http.dart' as http;

const url = "cliente/11";

class GruposController extends Controller {
  static Future<List<Grupo>> getGrupos() async {
    http.Response response = await http.get(Controller.urlBase + url);
    Map<String, dynamic> o = jsonDecode(response.body);
    List<Map<String, dynamic>> grupos =
        new List<Map<String, dynamic>>.from(o["dados"]);

    return grupos.map((x) => Grupo.fromMap(x)).toList();
  }
}
