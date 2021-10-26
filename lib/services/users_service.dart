import 'package:spending_tracker/interfaces/user.dart';
import 'package:spending_tracker/repositories/users_repository.dart';

class UsersService {
  var usersRepository = new UsersRepository();

  Future<User?> create({required User user}) async {
    await usersRepository.create(user);
    return await usersRepository.getSingle();
  }

  Future<User?> getSingle() async {
    User? user = await usersRepository.getSingle();
    return user;
  }

  Future<void> patchById(int id, {String? name}) async {
    User? user = await usersRepository.getSingle();
    if (user != null) {
      user.name = name;
      await usersRepository.updateById(id, user);
    }
  }

  Future<void> deleteAll() async {
    await usersRepository.deleteAll();
  }
}
