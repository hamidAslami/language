import 'package:stacked/stacked.dart';

class LessonVM extends FutureViewModel{

  Future getDataFromServer() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Future futureToRun() async{
    return await getDataFromServer();
  }
}
