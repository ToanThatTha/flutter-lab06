import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Một số con mèo thực sự bị dị ứng với con người.', true),
    Question('Bạn có thể dắt một con bò xuống cầu thang nhưng không thể dắt nó lên.', false),
    Question('Khoảng một phần tư số xương trong cơ thể người nằm ở bàn chân.', true),
    Question('Máu của loài sên có màu xanh lá cây.', true),
    Question('Tên thời con gái của mẹ Buzz Aldrin là "Moon".', true),
    Question('Ở Bồ Đào Nha, đi tiểu xuống đại dương là hành vi bất hợp pháp.', true),
    Question('Không có tờ giấy vuông khô nào có thể được gấp đôi quá 7 lần.', false),
    Question('Ở London, Anh, nếu bạn chết trong Tòa nhà Quốc hội, về mặt kỹ thuật bạn được hưởng một tang lễ cấp nhà nước.', true),
    Question('Âm thanh lớn nhất do một loài động vật tạo ra là 188 decibel và loài đó là voi châu Phi.', false),
    Question('Tổng diện tích bề mặt của hai lá phổi người vào khoảng 70 mét vuông.', true),
    Question('Google ban đầu có tên là "Backrub".', true),
    Question('Sô-cô-la ảnh hưởng đến tim và hệ thần kinh của chó; chỉ vài ounce cũng đủ để giết một con chó nhỏ.', true),
    Question('Ở bang West Virginia, Mỹ, nếu vô tình đâm phải một con vật bằng ô tô, bạn được phép mang nó về nhà để ăn.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() => _questionBank[_questionNumber].questionText;

  bool getCorrectAnswer() => _questionBank[_questionNumber].questionAnswer;

  bool isFinished() => _questionNumber >= _questionBank.length - 1;

  void reset() => _questionNumber = 0;
}
