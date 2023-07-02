import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String toMMMEdHmString() => DateFormat.MMMEd().add_Hm().format(this);
}
