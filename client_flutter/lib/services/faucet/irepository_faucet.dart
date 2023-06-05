import '../../models/account.dart';
import '../../models/faucet.dart';

abstract class IrepositoryFaucet {
  Future<List<Faucet>> getFaucet();
  Future<dynamic> requestFaucet(Account account);
}
