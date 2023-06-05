import '../common/map_util.dart';

class Faucet {
  String? balance = "0";

  Faucet({
    this.balance,
  });

  Map<String, dynamic> toMap() => {
    "balance": balance,
  };

  Faucet.fromJson(Map<String, dynamic> map) {
    balance = getItemFromMapForStr(map, "faucet");
  }

  @override
  String toString() => '${toMap()}';
}
