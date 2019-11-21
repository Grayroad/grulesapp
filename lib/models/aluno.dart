class Aluno {
  int idAluno;
  int idGrupo;
  String nome;
  String sobrenome;
  String cpf;
  String matricula;
  String celular;
  String email;
  String endereco;
  String numero;
  String complemento;
  String bairro;
  String estado;
  String cidade;
  String cep;
  String observacoes;

  static Aluno fromMap(Map map) {
    Aluno aluno = Aluno();
    aluno.idAluno = map["idAluno"];
    aluno.idGrupo = map["idGrupo"];
    aluno.nome = map["nome"];
    aluno.sobrenome = map["sobrenome"];
    aluno.cpf = map["cpf"];
    aluno.matricula = map["matricula"];
    aluno.celular = map["celular"];
    aluno.email = map["email"];
    aluno.endereco = map["endereco"];
    aluno.numero = map["numero"];
    aluno.complemento = map["complemento"];
    aluno.bairro = map["bairro"];
    aluno.estado = map["estado"];
    aluno.cidade = map["cidade"];
    aluno.cep = map["cep"];
    aluno.observacoes = map["observacoes"];

    return aluno;
  }
}
