import 'package:client_flutter/api/base_api.dart';
import 'package:client_flutter/models/account.dart';

class FaucetApi {
  static final _instance = FaucetApi._internal();
  factory FaucetApi() => _instance;

  FaucetApi._internal();

  int totalCount = 0;
  Map<String, Account> accountCache = {};

  Future<List<Account>> getFaucetTransactionList(int page, int batchSize) async {
    Map<String, dynamic> data = await Api().get("account/admin", query: {
      "take": batchSize,
      "page": page,
    });
    var results = data['results'];
    totalCount = data['total'];
    List<Account> accountList = (results as List)
        .map((x) => Account.fromJson(x))
        .toList();
    return accountList;
  }

  Future<Account> getAccountItemByAddress(String address) async {
    if(accountCache.containsKey(address)) {
      print('## $address is fetched from cache');
      return accountCache[address]!;
    }
    Map<String, dynamic> data = await Api().get("account/address/admin/$address");
    Account newAccount = Account.fromJson(data);
    if(newAccount != null && newAccount.address != null) {
      accountCache.putIfAbsent(newAccount.address!, () => newAccount);
    }
    return Account.fromJson(data);
  }

}
