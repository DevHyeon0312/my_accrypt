import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';

class DeleteAccountUseCase {
  final AccountRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteAccount(id);
  }
}