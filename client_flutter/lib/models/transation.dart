import '../common/map_util.dart';

class Transaction {
  String? hash = "0";

  Transaction({
    this.hash,
  });

  Map<String, dynamic> toMap() => {
    "hash": hash,
  };

  Transaction.fromJson(Map<String, dynamic> map) {
    hash = getItemFromMapForStr(map, "hash");
  }

  @override
  String toString() => '${toMap()}';
}
