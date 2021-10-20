import 'package:bilgitesti/question.dart';

class QVeri {
  int _qChange = 0;
  List<Question> _qBank = [
    Question(soru: 'Titanic gelmiş geçmiş en büyük gemidir', yanit: false),
    Question(
        soru: 'Dünyadaki tavuk sayısı insan sayısından fazladır', yanit: true),
    Question(soru: 'Kelebeklerin ömrü bir gündür', yanit: false),
    Question(soru: 'Dünya düzdür', yanit: false),
    Question(soru: 'Kaju fıstığı aslında bir meyvenin sapıdır', yanit: true),
    Question(soru: 'Fatih Sultan Mehmet hiç patates yememiştir', yanit: true),
    Question(soru: 'Fransızlar 80 demek için, 4 - 20 der', yanit: true),
  ];

  String getquestion() {
    return _qBank[_qChange].soru;
  }

  bool getAnswer() {
    return _qBank[_qChange].yanit;
  }

  void nextQ() {
    if (_qChange + 1 < _qBank.length) {
      _qChange++;
    }
  }

  bool qOver() {
    if (_qChange + 1 >= _qBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void qReset() {
    _qChange = 0;
  }
}
