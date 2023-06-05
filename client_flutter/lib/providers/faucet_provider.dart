
import 'package:client_flutter/common/constrant.dart';
import 'package:client_flutter/providers/type/paging_list_provider.dart';

class FaucetProvider extends PagingListProvider {
  FaucetProvider() {
    init();
  }

  @override
  Future<void> fetchList({int? page, int size = FETCH_SIZE}) async {
    // try {
    //   int fetchPage = page ?? currentPage;
    //   clear();
    //   startLoading();
    //   list.addAll(await FaucetApi().getFaucetTransactionList(fetchPage, batchSize));
    //   totalCount = FaucetApi().totalCount;
    //   stopLoading();
    // } catch (e) {
    //   print('## getAccountList() error >> ${e.toString()}');
    // }
  }

  @override
  Future<void> findByAddress(String address) {
    // TODO: implement findByAddress
    throw UnimplementedError();
  }

  @override
  Future<void> findByUserId(String userId) {
    // TODO: implement findByUserId
    throw UnimplementedError();
  }

}
