
import 'package:intl/intl.dart';


extension NumberSeparate on int {
  String get withNumberSeparate => this > 0 ? '$separateByComma' : '0';

  String get separateByComma {
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}


extension NumberDoubleSeparate on double {
  String get withNumberDoubleSeparate => this > 0 ? '$separateByComma' : '0';

  String get separateByComma {
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}
