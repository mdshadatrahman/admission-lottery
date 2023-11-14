// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer show log;

class DrawController extends GetxController {
  final homeController = Get.put(HomeController());

  void clearAll() {
    fqAdmittedStudents.value.clear();
    eqAdmittedStudents.value.clear();
    caqAdmittedStudents.value.clear();
    siblingAdmittedStudents.value.clear();
    generalAdmittedStudents.value.clear();
    allStudents.value.clear();
  }

  @override
  void dispose() {
    clearAll();
    fqAdmittedStudents.clear();
    eqAdmittedStudents.clear();
    caqAdmittedStudents.clear();
    siblingAdmittedStudents.clear();
    generalAdmittedStudents.clear();
    super.dispose();
  }

  final RxList<Student> fqAdmittedStudents = <Student>[].obs;
  final RxList<Student> eqAdmittedStudents = <Student>[].obs;
  final RxList<Student> caqAdmittedStudents = <Student>[].obs;
  final RxList<Student> siblingAdmittedStudents = <Student>[].obs;
  final RxList<Student> generalAdmittedStudents = <Student>[].obs;

  final RxList<Student> allStudents = <Student>[].obs;

  void drawFqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfFqQuota,
  }) {
    allStudents.addAll(homeController.students.value);
    int numberOfFqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfFqQuota / 100).round();
    fqAdmittedStudents.value.clear();

    developer.log('All students length in FQ Start: ${allStudents.length}');
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isFqOrEq?.toLowerCase() == 'fq' || allStudents[i].isFqOrEq?.toLowerCase() == 'eq') {
        if (fqAdmittedStudents.length == numberOfFqEligibleStudents) {
          break;
        }
        fqAdmittedStudents.add(allStudents[i]);
        homeController.students.remove(allStudents[i]);
      }
    }
    for (int i = 0; i < fqAdmittedStudents.length; i++) {
      allStudents.remove(fqAdmittedStudents[i]);
    }

    fqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawCaqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfCaqQuota,
  }) {
    caqAdmittedStudents.value.clear();
    developer.log('All students length in CAQ: ${allStudents.length}');
    final numberOfCaqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfCaqQuota / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isCaq?.toLowerCase() == 'yes') {
        if (caqAdmittedStudents.length == numberOfCaqEligibleStudents) {
          break;
        }
        caqAdmittedStudents.add(allStudents[i]);
        homeController.students.remove(allStudents[i]);
      }
    }
    for (int i = 0; i < caqAdmittedStudents.length; i++) {
      allStudents.remove(caqAdmittedStudents[i]);
    }
    caqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawSiblingEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfSiblingQuota,
  }) {
    siblingAdmittedStudents.value.clear();
    developer.log('All students length in Sibling: ${allStudents.length}');
    final numberOfSiblingEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfSiblingQuota / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isSibling?.toLowerCase() == 'yes') {
        if (siblingAdmittedStudents.length == numberOfSiblingEligibleStudents) {
          break;
        }
        siblingAdmittedStudents.add(allStudents[i]);
        homeController.students.remove(allStudents[i]);
      }
    }
    for (int i = 0; i < siblingAdmittedStudents.length; i++) {
      allStudents.remove(siblingAdmittedStudents[i]);
    }
    siblingAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawGeneralStudents({
    required int numberOfStudentsToBeAdmitted,
    required int generalQuotaStudents,
  }) {
    developer.log(generalQuotaStudents.toString());
    generalAdmittedStudents.value.clear();
    developer.log('All students length in General: ${allStudents.length}');
    // final numberOfGeneralEligibleStudents = (numberOfStudentsToBeAdmitted * generalQuotaStudents / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (generalAdmittedStudents.length == generalQuotaStudents) {
        break;
      }
      generalAdmittedStudents.add(allStudents[i]);
      homeController.students.remove(allStudents[i]);
    }
    for (int i = 0; i < generalAdmittedStudents.length; i++) {
      allStudents.remove(generalAdmittedStudents[i]);
    }
    generalAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
    developer.log('Left over students length in General: ${allStudents.length}', name: 'General');
    allStudents.sort((a, b) => a.sl!.compareTo(b.sl!));
  }

  void createExcel(BuildContext context) async {
    final excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    sheetObject.appendRow(['Freedom Fighter Quota: (${fqAdmittedStudents.length})']);
    for (int i = 0; i < fqAdmittedStudents.length; i++) {
      sheetObject.appendRow([fqAdmittedStudents[i].roll]);
    }

    sheetObject.appendRow(['Education Quota:(${eqAdmittedStudents.length})']);
    for (int i = 0; i < eqAdmittedStudents.length; i++) {
      sheetObject.appendRow([eqAdmittedStudents[i].roll]);
    }
    sheetObject.appendRow(['']);
    sheetObject.appendRow(['Catchment Area Quota:(${caqAdmittedStudents.length})']);
    for (int i = 0; i < caqAdmittedStudents.length; i++) {
      sheetObject.appendRow([caqAdmittedStudents[i].roll]);
    }
    sheetObject.appendRow(['']);
    sheetObject.appendRow(['Sibling Quota:(${siblingAdmittedStudents.length})']);
    for (int i = 0; i < siblingAdmittedStudents.length; i++) {
      sheetObject.appendRow([siblingAdmittedStudents[i].roll]);
    }
    sheetObject.appendRow(['']);
    sheetObject.appendRow(['General Quota: (${generalAdmittedStudents.length})']);
    for (int i = 0; i < generalAdmittedStudents.length; i++) {
      sheetObject.appendRow([generalAdmittedStudents[i].roll]);
    }
    final fileBytes = excel.save();
    final dir = await getApplicationDocumentsDirectory();
    final filename = '${dir.path}/result_${DateTime.now().millisecondsSinceEpoch}.xlsx';
    File(filename)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(filename),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
