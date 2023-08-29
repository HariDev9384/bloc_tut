


import '../utils/utils.dart';

class DataViewModel extends ChangeNotifier{
  final DataRepository _repository = DataRepository();
  ApiResponse<DataModel> data = ApiResponse.completed(DataModel());

setData(ApiResponse<DataModel> response) {
    data = response;
    notifyListeners();
  }

  Future<void> fetchData() async {
   setData(ApiResponse.loading());
    try {
      final data = await _repository.fetchData();
      logDebug('view model $data');
      setData(ApiResponse.completed(DataModel.fromJson(data)));
      notifyListeners();
    } catch (error) {
      setData(ApiResponse.error(error.toString()));
      notifyListeners();
    }
  }
}
