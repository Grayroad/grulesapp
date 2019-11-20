import 'package:flutter/material.dart';
import 'package:grulesapp/models/eventos.dart';
import 'package:grulesapp/ui/grupos.dart';
import 'package:intl/intl.dart';
import '../models/eventos_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grules App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos disponíveis"),
        centerTitle: true,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return FutureBuilder(
      future: EventoController.getEventos(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      default:
        if (snapshot.hasError) {
          return _error();
        } else {
          return _data(context, snapshot.data);
        }
    }
  }

  Widget _data(BuildContext context, List<Evento> grupos) {
    return ListView.separated(
      separatorBuilder: (context, i) {
        return Divider(
          height: 1,
        );
      },
      itemCount: grupos.length,
      itemBuilder: (context, indice) {
        return _getItem(context, grupos[indice]);
      },
    );
  }

  Widget _getItem(BuildContext context, Evento grupo) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GruposPage(grupo),
          ),
        );
      },
      leading: CircleAvatar(
        child: Icon(Icons.event),
      ),
      title: Text(grupo.descricao),
      subtitle: Row(
        children: <Widget>[
          Icon(
            Icons.event_available,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(DateFormat('dd/MM kk:mm').format(grupo.dataInicio)),
            ),
          ),
          Icon(
            Icons.event_busy,
            color: Colors.red[600],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(DateFormat('dd/MM kk:mm').format(grupo.dataTermino)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _error() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
  }
}
