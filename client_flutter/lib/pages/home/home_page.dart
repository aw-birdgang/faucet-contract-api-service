import 'package:client_flutter/components/paging_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/transation.dart';
import '../../providers/faucet_provider.dart';
import 'components/transaction_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget itemWidget(Transaction item) {
    return TransactionItem(item, key: Key("transaction_${item.hash}"));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FaucetProvider>(
      create: (context) => FaucetProvider(),
      child: Consumer<FaucetProvider>(
        builder: (context, provider, child) {
          return PagingListView(provider, itemWidget,);
          // return Container();
        },
      ),
    );
  }
}
