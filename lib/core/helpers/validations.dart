

extension FieldValidate on String {
  String? validate(List<String? Function(String?)> functions) {
    for (final String? Function(String?) func in functions) {
      final result = func(this);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

String? validateRequired(String? value) {
  return value!.isEmpty ? "Required Field" : null;
}

String? validatePassword(String? value) {
  return value!.length < 5
      ? "Weak Password"
      : value.length > 20
      ? "Invalid Password"
      : null;
}

String? matchesPasswords(String password, String confirmPassword) {
  return password != confirmPassword ? "Not Matching" : null;
}

String? validateEmail(String? value) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);
  if (!regExp.hasMatch(value!)) {
    return "Invalid Email";
  }
  return null;
}

String? validatePhone(String? value) {
  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);
  if (!regExp.hasMatch(value!)) {
    return "Invalid Phone Number";
  }
  return null;
}
