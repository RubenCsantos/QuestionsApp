import 'package:flutter/material.dart';
import './questao.dart';
import 'package:perguntas_app/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

const Questionario({
  required this.perguntas,
  required this.perguntaSelecionada,  //Required define obrigatoriedade
  required this.responder,
  super.key
});

  bool get temPerguntaSelecionada {  //funçao que devolve se pergunta seleciona está ou não fora do range
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> respostas = temPerguntaSelecionada ?  perguntas[perguntaSelecionada].cast()['resposta'] : [];  //caso haja pergunta despoleta a resposta se não devolve vazio
    
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => responder((resp['pontuacao'] as int)),
          );
        }).toList(),
      ],
    );
  } 
}