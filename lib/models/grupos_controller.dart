import 'dart:convert';

import 'controller.dart';
import 'grupos.dart';
import 'package:http/http.dart' as http;

const url = "cliente/11";

class GruposController extends Controller {
  static Future<List<Grupo>> getGrupos(int idEvento) async {
    // http.Response response = await http.get(Controller.urlBase + url);
    // Map<String, dynamic> o = jsonDecode(response.body);
    // List<Map<String, dynamic>> grupos =
    //     new List<Map<String, dynamic>>.from(o["dados"]);

    Grupo grupo1 = Grupo();
    grupo1.idEvento = 1;
    grupo1.idGrupo = 1;
    grupo1.titulo = "A grande perca de tempo";
    grupo1.descricao =
        """Iremos falar sobre como as pessoas perdem tempo em falar na frente de uma faculdade inteira sobre um tema de estrema esquerda e sem praticidade na àrea de atuação""";

    Grupo grupo2 = Grupo();
    grupo2.idEvento = 1;
    grupo2.idGrupo = 2;
    grupo2.titulo = "Programadores - Ódio incondicional";
    grupo2.descricao =
        """Programadores cada vez mais não se dão bem com usuários, o intelecto superior se torna impaciente ao comparado ao asno. Só que o ódio não para aí, programadores se tornaram incompatíveis com tudo que é gente""";

    List<Map<String, dynamic>> grupos = [grupo1.toMap(), grupo2.toMap()];

    return grupos.map((x) => Grupo.fromMap(x)).toList();
  }
}
