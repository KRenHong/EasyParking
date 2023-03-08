import 'dart:math';

import 'package:easyparking/models/parking_record.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:get/get.dart';

class RecordController extends GetxController implements GetxService{
  RecordController();

  List<ParkingRecord> _doneList = [];
  List<ParkingRecord> get doneList => _doneList;

  List<ParkingRecord> _parkingRecordList = [];
  List<ParkingRecord> get parkingRecordList => _parkingRecordList;

  void getParkingRecordList() {
    _parkingRecordList = AppConstant.parkingRecordList;
  }

  void doneParking(ParkingRecord parkingRecord) {
    var tempDoneList = _doneList;
    _parkingRecordList.removeWhere((element) {
      if(element.place == parkingRecord.place) {
        element.setStatus(false);
        tempDoneList.add(element);
      }
      _doneList = tempDoneList.reversed.toList();
      return element.place == parkingRecord.place;
    });
    update();
  }
  
}