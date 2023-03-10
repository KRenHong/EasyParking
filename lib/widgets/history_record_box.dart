import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/payment_record.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class HistoryRecordBox extends StatelessWidget {
  final PaymentRecord paymentRecord;
  const HistoryRecordBox({super.key, required this.paymentRecord});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.height20 * 5,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Dimensions.height10 * 5,
            width: Dimensions.width20 * 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(paymentRecord.logo)
              )
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Text(
                paymentRecord.title,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSize16,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount Due",
                style: TextStyle(
                  color: AppColors.paleGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.fontSize12
                ),
              ),
              SizedBox(height: Dimensions.height10/2,),
              Text(
                paymentRecord.price,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSize12
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}