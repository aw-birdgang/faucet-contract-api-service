import 'package:client_flutter/providers/type/paging_list_provider.dart';
import 'package:flutter/material.dart';

import 'faucet_container.dart';

class PagingListView extends StatelessWidget {
  PagingListProvider parentListProvider;
  Function itemWidgetFunction;
  PagingListView(this.parentListProvider, this.itemWidgetFunction, {
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // getTextInfoRow(context, "NAME", ""),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaucetContainer(parentListProvider),
          ],
        ),
        const SizedBox(height: 8.0),
        // Expanded(
        //     child: parentListProvider.list.isNotEmpty ? SingleChildScrollView(
        //       padding: const EdgeInsets.all(0.0),
        //       controller: parentListProvider.scrollController,
        //       child: ListView.builder(
        //         padding: const EdgeInsets.all(0.0),
        //         itemCount: parentListProvider.list.length,
        //         shrinkWrap: true,
        //         physics: const NeverScrollableScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           dynamic item = parentListProvider.list[index];
        //           return itemWidgetFunction(item);
        //         }
        //       ),
        //     ) : const Center(child: CircularProgressIndicator()),
        // ),
      ],
    );
  }
}
