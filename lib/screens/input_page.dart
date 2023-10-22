import 'package:flutter/material.dart';
import 'package:imc/components/reusable_card.dart';
import 'package:imc/constants.dart';
import 'package:imc/screens/results_page.dart';
import 'package:imc/components/bottom_button.dart';
import 'package:imc/components/round_icon_button.dart';
import 'package:imc/pessoa.dart';
import 'package:flutter/cupertino.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int peso = 60;
  int altura = 180;
  late String nome = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              onPressed: () => {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Nome',
                    style: kLabelTextStyle,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (String value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPressed: () => {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Altura',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        altura.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          altura = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () => {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Peso',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: CupertinoIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    peso--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: CupertinoIcons.add,
                              onPressed: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcular',
            onTap: () {
              Pessoa pessoa = Pessoa(altura: altura, peso: peso, nome: nome);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    resultadoIMC: pessoa.calcularIMC(),
                    resultado: pessoa.getResultado(),
                    nomePessoa: pessoa.getNome,
                    interpretacao: pessoa.getInterpretacao(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
