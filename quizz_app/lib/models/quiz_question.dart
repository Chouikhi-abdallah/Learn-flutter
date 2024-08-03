class QuizQuestion{
  final String text;
  final List<String>answers;

  const QuizQuestion(this.text,this.answers);

  String getText(){
    return text;
  }

  List<String> getAnswer(){
    return answers;
  }

  List<String> shuffeledList(){
    List<String> answersCopy=List.of(answers);
    answersCopy.shuffle();

    return answersCopy;
  }



}