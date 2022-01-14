import 'package:flutter/material.dart';

List<String> classPicture = [
  "assets/filter/class/1.png",
  "assets/filter/class/2.png",
  "assets/filter/class/3.png",
];
List<String> classNames = [
  "Economy",
  "Business",
  "Premium",
];
List<bool> indexes = [false, false, false, false];
List<bool> indexes2 = [false, false, false, false];
List<String> km = [
  ">200",
  "250-350",
  "400-500",
  "<500",
];
String inputKm = "";
List<Map<String, String>> priceRange = [
  {"boshlanish": "", "tugash": ""}
];
List<String> bodyTypes = ["assets/filter/bodytype/1.png"];
List<String> bodyTypeNames = [
  "S.U.V",
  "Sedan",
  "Pick Up",
  "Sport",
];
String inputbodyTYPE = "";

String? from;
String? to;
