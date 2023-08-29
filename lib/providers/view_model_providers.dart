
import '../utils/utils.dart';

class MyProvider {
  List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(create: (_) => DataViewModel()),
    // Add other providers here if needed.
  ];
}