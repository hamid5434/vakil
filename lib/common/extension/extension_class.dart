extension validPath on String {
  String get isValidName {
    String temp = this;
    if (length > 1) {
      if (temp.substring(0, 1) != '/') {
        temp = '/$temp';
      }

      if (temp.substring(temp.length - 1, temp.length) == '/') {
        temp = temp.substring(0, temp.length - 1 );
      }
    }
    return temp ;
  }
}
