class NumberSequence {
  double currentNumber;
  bool isIncreasing;

  NumberSequence({this.currentNumber = -100.0, this.isIncreasing = true});

  double getNextNumber() {
    if (isIncreasing) {
      currentNumber += 50.0;
      if (currentNumber >= 50.0) {
        isIncreasing = false;
      }
    } else {
      currentNumber -= 50.0;
      if (currentNumber <= -150.0) {
        isIncreasing = true;
      }
    }
    return currentNumber;
  }
}