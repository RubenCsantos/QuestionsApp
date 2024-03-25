import 'package:flutter/material.dart';
import 'package:perguntas_app/questionario.dart';
import 'package:perguntas_app/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Pato', 'pontuacao': 5},
        {'texto': 'Cão', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a sua comida favorita?',
      'resposta': [
        {'texto': 'Carne', 'pontuacao': 10 },
        {'texto': 'Peixe', 'pontuacao': 5 },
        {'texto': 'Legumes', 'pontuacao': 3 },
        {'texto': 'Sopa', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    //set num estado
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  bool get temPerguntaSelecionada {
    //funçao que devolve se pergunta seleciona está ou não fora do range
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgets = [];
    /* for(String textoResp in perguntas[_perguntaSelecionada]['resposta'] as List){
      widgets.add(Resposta(textoResp, _responder));
    }*/

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
