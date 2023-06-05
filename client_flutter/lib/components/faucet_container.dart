import 'package:client_flutter/shared/constants.dart';
import 'package:flutter/material.dart';

import '../providers/type/paging_list_provider.dart';

class FaucetContainer extends StatelessWidget {
  PagingListProvider parentListProvider;
  FaucetContainer(this.parentListProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              onSubmitted: (str) {
                if(str.isEmpty) return;
              },
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(r"^[ㄱ-ㅎ가-힣0-9a-zA-Z]$"),
              // ],
              decoration: const InputDecoration(
                hintText: "Enter Your Wallet Address (0x...)",
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0,),
          InkWell(
              onTap: () {
              },
              child: Container(
                width: 48.0, height: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.generating_tokens, color: Colors.white, size: 24.0),
              )
          )
        ],
      ),
    );
  }
}
