import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_testing_app/model/student_model.dart';

import '../model/student_model.dart';

class LoadStringHelper{
  LoadStringHelper._();

static final  LoadStringHelper loadStringHelper = LoadStringHelper._();

Future<List<StudentModel>> loadJson()async{
  // List<StudentModel> students;
String? data =  await rootBundle.loadString("assets/json/students.json");

List decodedData = jsonDecode(data);

List<StudentModel> studentmodel = decodedData.map((e) => StudentModel.fromMap(data: e)).toList() ;

return studentmodel;

}
}