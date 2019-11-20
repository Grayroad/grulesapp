import 'package:flutter/material.dart';
import '../models/grupos.dart';
import '../models/grupos_controller.dart';
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
      body: FutureBuilder(
        future: GruposController.getGrupos(_evento.idEvento),
        builder: _builder,
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<List<Grupo>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      default:
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red[600],
                  ),
                ),
                Text(
                  "Algum erro ocorreu durante a obtenção de eventos!",
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, i) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) =>
                _itemBuilder(context, snapshot.data[i]),
          );
        }
        break;
    }
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
        ],
      ),
    );
  }
}
