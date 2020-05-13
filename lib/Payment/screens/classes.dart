import 'package:flutter/material.dart';

class Months {
  String month;

  Months(this.month);

  static List<Months> months = [
    Months('01'),
    Months('02'),
    Months('03'),
    Months('04'),
    Months('05'),
    Months('06'),
    Months('07'),
    Months('08'),
    Months('09'),
    Months('10'),
    Months('11'),
    Months('12')
  ];
}

List<DropdownMenuItem<Months>> buildDropDownMenuMonthItems() {
  List<DropdownMenuItem<Months>> item = List();
  for (Months month in Months.months) {
    item.add(DropdownMenuItem(value: month, child: Text(month.month)));
  }
  return item;
}

class Year {
  String year;
  Year(this.year);

  static List<Year> years = [
    Year('YYYY'),
    Year('2021'),
    Year('2022'),
    Year('2023'),
    Year('2024'),
    Year('2025'),
    Year('2026'),
    Year('2027'),
    Year('2028'),
    Year('2029'),
    Year('2030'),
  ];
}

List<DropdownMenuItem<Year>> buildDropDownMenuYearItems() {
  List<DropdownMenuItem<Year>> items = List();
  for (Year year in Year.years) {
    items.add(DropdownMenuItem(value: year, child: Text(year.year)));
  }
  return items;
}
