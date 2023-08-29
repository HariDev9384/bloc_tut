import 'package:bloc_tut/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _callApi(); // Call the API after the initial build
    });
  }
  
  // Method to call the API
  _callApi() async {
    await Provider.of<DataViewModel>(context,listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height/1,
        child: Center(
          child: Consumer<DataViewModel>(
          builder: (context, value, child) {
            switch (value.data.status) {
                case Status.loading:
              return  const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
               return Center(
                  child: Text(
                    value.data.message.toString(),
                  ),
                );
              case Status.completed:
              return Center(child: Text(value.data.data!.userId.toString()));
              default:
                {
                  return const Center();
                }
            }
            
          }),
        ),
      ),
    );
  }
}