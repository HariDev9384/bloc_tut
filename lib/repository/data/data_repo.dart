
import '../../utils/utils.dart';

class DataRepository {
      final NetworkService network = NetworkService();
      Future<dynamic> fetchData() async {
        try {
          final response = await network.getGetApiResponse('/albums/1');
          return response;
        } catch (e) {
          rethrow;
        }
      }
}


