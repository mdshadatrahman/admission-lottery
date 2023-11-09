class Student {
  String? sl;
  String? roll;
  String? isFq;
  String? isEq;
  String? isCaq;
  String? isSibling;
  String? isGeneral;

  Student({
    required this.sl,
    required this.roll,
    required this.isFq,
    required this.isEq,
    required this.isCaq,
    required this.isSibling,
    required this.isGeneral,
  });
}

enum QuotaTypes {
  fq, //Freedom Fighter Quota
  eq, // Education Quota
  caq, // Catchment Area Quota
  sibling, // Sibling Quota
  no, // No Quota
}
