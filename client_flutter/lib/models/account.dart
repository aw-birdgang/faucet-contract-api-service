import '../common/map_util.dart';

class Account {
  String? address = "0";

  Account({
    this.address,
  });

  Map<String, dynamic> toRequestMap() => {
    "address": address,
  };

  Account.fromJson(Map<String, dynamic> map) {
    address = getItemFromMapForStr(map, "address");
  }

  @override
  String toString() => '${toRequestMap()}';
}
