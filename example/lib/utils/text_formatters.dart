import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only two decimal places
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '0.00');
    } else if (newValue.text.contains('.') && newValue.text.split('.')[1].length > 2) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}