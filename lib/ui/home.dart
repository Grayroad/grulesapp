import 'package:flutter/material.dart';
import '../models/grupos.dart';
import '../models/grupos_controller.dart';

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
      future: GruposController.getGrupos(),
      builder: _builder,
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
          return _error();
        } else {
          return _data(snapshot.data);
        }
    }
  }

  Widget _data(List<Grupo> grupos) {
    return ListView.builder(
      itemCount: grupos.length,
      itemBuilder: (context, indice) {
        return _getItem(grupos[indice]);
      },
    );
  }

  Widget _getItem(Grupo grupo) {
    return ListTile(
      title: Text("${grupo.id}"),
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
