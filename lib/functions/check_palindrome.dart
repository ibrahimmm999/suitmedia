bool checkPalindrome(String input) {
  String processedInput = input.replaceAll(' ', '').toLowerCase();
  String reversedInput = processedInput.split('').reversed.join('');
  return processedInput == reversedInput;
}
