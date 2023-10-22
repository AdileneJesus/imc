import 'package:flutter/material.dart';
import 'package:imc/constants.dart';
import 'package:imc/components/reusable_card.dart';
import 'package:imc/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretacao,
      required this.resultadoIMC,
      required this.nomePessoa,
      required this.resultado});

  final String resultadoIMC;
  final String resultado;
  final String nomePessoa;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(1.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Seu Resultado: $nomePessoa",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPressed: () => {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultado.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretacao,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcular Novamente',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
