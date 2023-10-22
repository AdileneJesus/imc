import 'dart:math';

class Pessoa {
  Pessoa({required this.altura, required this.peso, required this.nome});

  final int altura;
  final int peso;
  final String nome;
  late double imc;

  String get getNome {
    return nome;
  }

  String calcularIMC() {
    imc = peso / pow(altura / 100, 2);
    return imc.toStringAsFixed(1);
  }

  String getResultado() {
    if (imc >= 25) {
      return 'Acima do Peso';
    } else if (imc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do Peso';
    }
  }

  String getInterpretacao() {
    if (imc >= 25) {
      return 'Você tem um peso corporal acima do normal. Tente se exercitar mais.';
    } else if (imc >= 18.5) {
      return 'Você tem um peso corporal normal. Bom trabalho!';
    } else {
      return 'Você tem um peso corporal inferior ao normal. Você pode comer um pouco mais.';
    }
  }
}
