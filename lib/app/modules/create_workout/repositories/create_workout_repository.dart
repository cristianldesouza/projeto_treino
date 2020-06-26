import 'package:dio/native_imp.dart';
import 'interfaces/create_workout_repository_interface.dart';

class CreateWorkoutRepository implements ICreateWorkoutRepository {
  final DioForNative client;

  CreateWorkoutRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
