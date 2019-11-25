import 'package:flutter/material.dart';
import 'package:grulesapp/models/aluno.dart';
import '../models/grupos.dart';
import '../models/eventos.dart';

class GruposPage extends StatefulWidget {
  final Evento evento;

  GruposPage(this.evento);

  @override
  _GruposPageState createState() => _GruposPageState();
}

class _GruposPageState extends State<GruposPage> {
  Evento _evento;

  @override
  void initState() {
    super.initState();

    setState(() {
      _evento = widget.evento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_evento.descricao),
          centerTitle: true,
        ),
        body: ListView.separated(
          separatorBuilder: (context, i) => Divider(),
          itemCount: _evento.grupos.length,
          itemBuilder: (context, i) => _itemBuilder(context, _evento.grupos[i]),
        ));
  }

  Widget _itemBuilder(BuildContext context, Grupo grupo) {
    return GestureDetector(
      onTap: () {},
      child: GrupoItem(grupo),
    );
  }
}

class GrupoItem extends StatelessWidget {
  final Grupo grupo;
  GrupoItem(this.grupo);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.group),
            ),
            title: Text(grupo.titulo),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              grupo.descricao,
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(),
          Text("Apresentadores"),
          Divider(),
          AlunosPage(grupo.alunos)
        ],
      ),
    );
  }
}

class AlunosPage extends StatelessWidget {
  final List<Aluno> alunos;
  AlunosPage(this.alunos);
  double get _height {
    return (alunos.length * 90).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: _height,
      child: ListView.separated(
        separatorBuilder: (a, b) => Divider(),
        itemCount: alunos.length,
        itemBuilder: (a, b) => ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text("${alunos[b].nome} ${alunos[b].sobrenome}"),
          subtitle: Text("Matricula: ${alunos[b].matricula}"),
        ),
      ),
    );
  }
}
