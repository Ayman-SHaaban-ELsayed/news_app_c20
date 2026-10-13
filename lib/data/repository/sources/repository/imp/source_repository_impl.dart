//Note: source repo implementation
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:news_app_c20/data/repository/sources/data_source/local/source_local_data_source.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/source_remote_data_source.dart';
import 'package:news_app_c20/data/repository/sources/repository/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceLocalDataSource sourceLocalDataSource;

  SourceRepositoryImpl({
    required this.sourceRemoteDataSource,
    required this.sourceLocalDataSource,
  });

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    print("ayman// started test connection");
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    // Determines whether any active network connection exists.
    if (connectivityResult.hasConnectivity) {
      // Connectivity available (regardless of the underlying transport).
      print("ayman// hasConnectivity: Connected");
    } else {
      print("ayman// hasConnectivity: Not Connected");
    }

    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      print("ayman// contains: Connected");
      //Note:internet =>remote ds
      var sourceResponse = await sourceRemoteDataSource.getSources(categoryId);
      //Note: save sources
      sourceLocalDataSource.saveSources(sourceResponse,categoryId);
      return sourceResponse;
    } else {
      print("ayman// contains: Not Connected");
      //Note: No Internet =>local ds
      var sourceResponse = await sourceLocalDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
