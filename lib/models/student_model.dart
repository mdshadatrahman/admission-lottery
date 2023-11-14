import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String? sl;
  final String? roll;
  final String? isFqOrEq;
  final String? isCaq;
  final String? isSibling;
  final String? isGeneral;

  const Student({
    required this.sl,
    required this.roll,
    required this.isFqOrEq,
    required this.isCaq,
    required this.isSibling,
    required this.isGeneral,
  });

  @override
  List<Object?> get props => [sl, roll, isFqOrEq, isCaq, isSibling, isGeneral];
}
