///   Problem: Student Grading System
///  You are building a student grading system. Each student has a name and a test score.
///  Your task is to write a Dart function called studentGrade that takes in the student's name and test score,
///   and returns their corresponding grade based on the following grading scale:
///   A: 90 - 100
///   B: 80 - 89
///   C: 70 - 79
///   D: 60 - 69
///   F: 0 - 59
///   The function should validate the test score and ensure it is within the valid range of 0 to 100.
///   If the score is valid, it should return the grade. If the score is invalid, it should return "Invalid Grade".
///   Here's an example usage of the studentGrade function:

void main(){
  String studentName = "Faisal A. Salam";  /// student name must be yours
  int testScore = 80;
  String grade  = studentGrade(studentName, testScore);
  print("$studentName's grade: $grade");
}

/// Dart function called studentGrade
String studentGrade(studentName, testScore){

  String grade;

  if( testScore >= 90 && testScore <= 100){
    grade = "A";
  }else if( testScore >= 80 && testScore <= 89){
    grade = "B";
  }else if( testScore >= 70 && testScore <= 79){
    grade = "C";
  }else if( testScore >= 60 && testScore <= 69){
    grade = "D";
  }else if( testScore >= 0 && testScore <= 59) {
    grade = "E";
  }else{
    grade = "Invalid Grade";
  }

  return grade;
}