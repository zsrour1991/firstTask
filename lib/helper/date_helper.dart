
import 'package:intl/intl.dart';


//all formatting stuff and date operations should be added here
class DateHelper{




  static String getFormatDDMM(DateTime? date){
    var formatter = DateFormat('dd/MM, KK:mm');
    return formatter.format(date!);
  }





}