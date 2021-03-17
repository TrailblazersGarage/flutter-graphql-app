import 'package:cndv/src/models/campanhas_models.dart';
import 'package:flutter/material.dart';

class CampanhaDetalhe extends StatelessWidget {
  final ObtenerCampanha campanha;

  CampanhaDetalhe({Key key, this.campanha}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final faixaEtaria = Container(
      padding: const EdgeInsets.all(5.0),
      child: new Text(
        'Idades: ' + campanha.idadeInicio.toString() + ' a ' + campanha.idadeFinal.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          Icons.medical_services,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          campanha.nome,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            /*Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      campanha.cidade,
                      style: TextStyle(color: Colors.white),
                    ))),*/
            Expanded(flex: 2, child: faixaEtaria),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/img/vacinacao_agulha_image.jpeg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 10.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      campanha.descricao,
      style: TextStyle(fontSize: 18.0, color: Colors.black),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Buscar Postos de Saúde", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Expanded(
      child: SafeArea(
        child: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(40.0),
        child: Center(
              child: Column(
                children: <Widget>[bottomContentText, readButton],
              ),
            ),
          ),
        )),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}