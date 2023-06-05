import 'package:client_flutter/models/transation.dart';
import 'package:client_flutter/services/faucet/irepository_faucet.dart';
import 'package:dio/dio.dart';

import '../../models/account.dart';
import '../../models/faucet.dart';
import '../configure/http_configuration_provider.dart';

class RepositoryFaucet implements IrepositoryFaucet {

  @override
  Future<List<Faucet>> getFaucet() {
    // TODO: implement getFaucet
    throw UnimplementedError();
  }

  @override
  Future requestFaucet(Account account) async {
    // String api = dotenv.get('API_URL');
    HttpConfigurationProvider provider = HttpConfigurationProvider();
    String api = provider.getBaseApiUrl ();
    String url = '$api/v1/faucet/withdraw';
    print('requestFaucet > url :: $url');
    print('requestFaucet > faucet.toString() :: $account');
    // String apiKey = dotenv.get('API_KEY');
    // String apiKey = provider.getApiKey();
    // print('requestFaucet > apiKey :: $apiKey');
    Dio dio = Dio();
    // dio.options.headers["Authorization"] = 'Bearer $apiKey';
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler) async {
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (error, handler) {
          print('requestFaucet > error.message :: ${error.message}');
          return  handler.next(error);
        }
    ));
    // dio.interceptors.add(CustomLogInterceptor());
    Response response = await dio.post(url, data: account.toRequestMap());
    return Transaction.fromJson(response.data);
  }

}
