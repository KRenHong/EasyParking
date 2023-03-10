import 'package:easyparking/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import '../models/parking_record.dart';

class ParkingRecordBox extends StatefulWidget {
  final ParkingRecord parkingRecord;
  const ParkingRecordBox({super.key, required this.parkingRecord});

  @override
  State<ParkingRecordBox> createState() => _PaymentRecordBoxState();
}

class _PaymentRecordBoxState extends State<ParkingRecordBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.height10 * 22,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: const Color(0xffF9F9F9)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Dimensions.height10 * 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Image
                Container(
                  height: Dimensions.height10 * 8,
                  width: Dimensions.height10 * 8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.parkingRecord.image)
                    )
                  ),
                ),
                SizedBox(width: Dimensions.width20,),
                //Details
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.parkingRecord.place,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSize20,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(
                              widget.parkingRecord.subPlace,
                              maxLines: 1,
                              style: TextStyle(
                                color:const Color(0xffA1A1A1),
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSize14,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "MYR" + widget.parkingRecord.price.toString(),
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimensions.fontSize14,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                Text(
                                  "/ 2 hours",
                                  style: TextStyle(
                                    color: const Color(0xffA1A1A1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimensions.fontSize20/2,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: Dimensions.height30,
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(Dimensions.radius10),
                                border: Border.all(
                                  width: 1,
                                  color: widget.parkingRecord.status? AppColors.blue: AppColors.green,
                                )
                              ),
                              child: Center(
                                child: Text(
                                  widget.parkingRecord.status? "Ongoing": "Completed",
                                  style: TextStyle(
                                    color: widget.parkingRecord.status? AppColors.blue: AppColors.green,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimensions.fontSize12,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.grey,),
          Container(
            width: double.maxFinite,
            height: Dimensions.height10 * 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              border: Border.all(
                width: 1,
                color: AppColors.yellow
              )
            ),
            child: Center(
              child: Text(
                "View",
                style: TextStyle(
                  color: AppColors.yellow,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSize16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}