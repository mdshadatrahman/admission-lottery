// ignore_for_file: invalid_use_of_protected_member, use_build_context_synchronously

import 'dart:io';

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/models/student_list.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
      if (allStudents[i].isFqOrEq?.toLowerCase() == 'fq') {
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

  void drawEqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfEqQuota,
  }) {
    eqAdmittedStudents.value.clear();
    developer.log('All students length in EQ: ${allStudents.length}');

    final numberOfEqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfEqQuota / 100).round();
    developer.log('Number of EQ Eligible Students: $numberOfEqEligibleStudents');

    allStudents.shuffle();

    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isFqOrEq?.toLowerCase() == 'eq') {
        if (eqAdmittedStudents.length == numberOfEqEligibleStudents) {
          break;
        }
        eqAdmittedStudents.add(allStudents[i]);
        homeController.students.remove(allStudents[i]);
      }
    }
    for (int i = 0; i < eqAdmittedStudents.length; i++) {
      allStudents.remove(eqAdmittedStudents[i]);
    }
    eqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
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

    //
    for (int i = 0; i < customStudents.length; i++) {
      for (int j = 0; j < allStudents.length; j++) {
        if (allStudents[j].roll == customStudents[i]) {
          generalAdmittedStudents.add(allStudents[j]);
          homeController.students.remove(allStudents[j]);
          allStudents.remove(allStudents[j]);
          developer.log('Custom Student: ${customStudents[i]}', name: 'Custom');
        }
      }
    }
    //

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

  Future<void> generatePdf(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(10),
        clip: false,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.SizedBox(height: 120),
              pw.Expanded(
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      children: [
                        pw.Text(
                          'Freedom Fighter Quota: (${fqAdmittedStudents.length})',
                          style: const pw.TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        for (int i = 0; i < fqAdmittedStudents.length; i++)
                          pw.Text(
                            fqAdmittedStudents[i].roll!,
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          '\nEducation Quota:(${eqAdmittedStudents.length})',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        pw.SizedBox(height: 10),
                        for (int i = 0; i < eqAdmittedStudents.length; i++)
                          pw.Text(
                            eqAdmittedStudents[i].roll!,
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          '\nCatchment Area Quota:(${caqAdmittedStudents.length})',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        pw.SizedBox(height: 10),
                        for (int i = 0; i < caqAdmittedStudents.length; i++)
                          pw.Text(
                            caqAdmittedStudents[i].roll!,
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          '\nSibling Quota:(${siblingAdmittedStudents.length})',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        pw.SizedBox(height: 10),
                        for (int i = 0; i < siblingAdmittedStudents.length; i++)
                          pw.Text(
                            siblingAdmittedStudents[i].roll!,
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          '\nGeneral Quota: (${generalAdmittedStudents.length})',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        pw.SizedBox(height: 10),
                        for (int i = 0; i < generalAdmittedStudents.length; i++)
                          pw.Text(
                            generalAdmittedStudents[i].roll!,
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );

    final fileBytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final filename = '${dir.path}/result_${DateTime.now().millisecondsSinceEpoch}.pdf';
    File(filename)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);
    // final file = File('example.pdf');
    // await file.writeAsBytes(await pdf.save());
    developer.log('path: $filename', name: 'PDF');
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
