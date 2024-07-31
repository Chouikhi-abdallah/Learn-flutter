import 'dart:math';

class GenrateRandomIntegers{
  int min;
  int max;

  GenrateRandomIntegers(this.min,this.max);

  int genrate(){
    var rng = Random();

  // Generate a random integer from 1 to 10
  int randomInt = rng.nextInt(max) + min;

  return randomInt;

  }
}