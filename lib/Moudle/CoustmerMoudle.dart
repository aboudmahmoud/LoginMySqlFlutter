import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


/*class CoustmerDataSource extends DataGridSource {

  CoustmerDataSource(this.Coustemr) {
    buildDataGridRow();
  }

  void buildDataGridRow() {
    _CoustemrDataGridRows = Coustemr
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<int>(columnName: 'id', value: e.id),
          DataGridCell<String>(columnName: 'name', value: e.name),
          DataGridCell<String>(
              columnName: 'email', value: e.email),
          DataGridCell<String>(columnName: 'phone', value: e.phone),
        ]))
        .toList();


  }

  List<CoustemrMoulde> Coustemr = [];

  List<DataGridRow> _CoustemrDataGridRows = [];

  @override
  List<DataGridRow> get rows => _CoustemrDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
  void updateDataGrid() {
    notifyListeners();
  }

}*/

class CoustemrMoulde {

  String? name;
  String? phone;


  CoustemrMoulde({  required this.name, required this.phone});
  factory CoustemrMoulde.fromJson(Map<String, dynamic> json) {
    return CoustemrMoulde(
        name: json['name'] as String,
        phone: json['phone'] as String,);
  }


}