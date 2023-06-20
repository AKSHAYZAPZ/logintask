String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  } else if (value.length < 3) {
    return 'Must have atlease 3 characters';
  } else {
    return null;
  }
}

String? validateemail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  } else if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value)) {
    return 'Enter valid e-mail';
  } else {
    return null;
  }
}

String? validatepassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  } else if (value.length < 6) {
    return 'Password must contain atleast 6 characters';
  } else if (!RegExp(r'^^((?!.*[\s]))').hasMatch(value)) {
    return 'Password cannot contain spaces';
  } else {
    return null;
  }
}

String? validateDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your date of birth';
  } else {
    return null;
  }
}