
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


// class NumbersListProvider with ChangeNotifier{
//    final List<int> numbers ;
//   void add(){
//       int last=numbers.last;
//             numbers.add((last+1));    
           
//           }
//              notifyListeners();
//   }

class NumbersListProvider with ChangeNotifier {
  final List<int> numbers = [];

  void add() {
    if (numbers.isEmpty) {
      numbers.add(0);
    } else {
      int last = numbers.last;
      numbers.add(last + 1);
    }
    notifyListeners();
  }
}
