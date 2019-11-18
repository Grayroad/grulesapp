class Grupo {
  int id;

  static Grupo fromMap(Map map) {
    Grupo grupo = Grupo();
    grupo.id = map["id"];
    return grupo;
  }
}
