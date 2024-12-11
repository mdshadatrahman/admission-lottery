import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String? sl;
  final String? roll;
  final String? isFq;
  final String? isEq;
  final String? isCaq;
  final String? isSibling;
  final String? isTwin;
  final String? isLillahBoarding;
  final String? isDisablity;
  final String? isGeneral;

  const Student({
    required this.sl,
    required this.roll,
    required this.isFq,
    required this.isEq,
    required this.isCaq,
    required this.isSibling,
    required this.isTwin,
    required this.isLillahBoarding,
    required this.isDisablity,
    required this.isGeneral,
  });

  @override
  List<Object?> get props => [sl, roll, isFq, isEq, isCaq, isSibling, isTwin, isLillahBoarding, isDisablity, isGeneral];
}
