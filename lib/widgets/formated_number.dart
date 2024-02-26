String formatPhoneNumber(String inputPhoneNumber) {
  // Remove non-numeric characters
  String numericString = inputPhoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  // Insert spaces after every 3 digits
  String formattedNumber = '';
  for (int i = 0; i < numericString.length; i += 3) {
    int endIndex = i + 3;
    if (endIndex > numericString.length) {
      endIndex = numericString.length;
    }
    formattedNumber += ' ${numericString.substring(i, endIndex)}';
  }

  return formattedNumber.trim(); // Remove leading space
}
