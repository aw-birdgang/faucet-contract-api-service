import 'package:client_flutter/components/default_text_info_col.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../shared/constants.dart';
import '../../../models/transation.dart';

class TransactionItem extends StatefulWidget {
  TransactionItem(this.transaction, {Key? key}) : super(key: key);
  Transaction transaction;
  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(0.05),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          print("WalletAccountItem > onTap ");
          //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountDetail(widget.account)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contentView (),
          ],
        ),
      ),
    );
  }

  Widget contentView () {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTextInfoCol(context, "USER ID", ""),
        ],
      ),
    );
  }

  Widget flutterSwitch () {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlutterSwitch(
            value: status,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ],
      ),
    );
  }

}
