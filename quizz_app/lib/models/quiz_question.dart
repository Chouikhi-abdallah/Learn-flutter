class QuizQuestion{
  // attributes
  final String text;
  final List<String>answers;

  //constructor

  const QuizQuestion(this.text,this.answers);

  String getText(){
    return text;
  }

  List<String> getAnswer(){
    return answers;
  }

  List<String> shuffeledList(){
    List<String> answersCopy=List.of(answers);
    answersCopy.shuffle(); // this function does : Randomizes the order of elements in a list.

    return answersCopy;
  }



}