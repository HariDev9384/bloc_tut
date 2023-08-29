
import 'package:bloc_tut/view/home.dart';

import 'utils/utils.dart';

intialize(){
  runApp(
   MultiProvider(
    providers: MyProvider().providers,
    child: const MyApp(),
   )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}