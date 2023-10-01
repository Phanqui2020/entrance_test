class Regex {
  static RegExp regLength = RegExp(r"^.{6,18}$");
  static RegExp regEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp regNumber = RegExp(r".*[0-9].*");
  static RegExp regUpperLetter = RegExp(r".*[A-Z].*");
  static RegExp regLowerLetter = RegExp(r".*[a-z].*");
  static RegExp regCharacter = RegExp(r"[ `!@#$%^&*()_+\-=\[\]{};':\\|,.<>\/?~]");
}
