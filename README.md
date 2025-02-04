# Project Description
- This app is designed to record and manage multiple accounts in one place.

# Flutter MVVM + Clean Architecture
`Riverpod(hooks) , Dio, Freezed, Shared Preferences, ...`

# Project Structure
```
📂 lib
┣ 📂 app : ...
┣ 📂 common : ...
┣ 📂 features
┃ ┣ 📂 accrypt
┃ ┃ ┣ 📂 data : Data Layer
┃ ┃ ┃ ┣ 📂 datasources
┃ ┃ ┃ ┃ ┗ 📜 account_local_data_source.dart
┃ ┃ ┃ ┣ 📂 models
┃ ┃ ┃ ┃ ┗ 📜 account.dart
┃ ┃ ┃ ┗ 📂 repositories
┃ ┃ ┃   ┗ 📜 account_repository_impl.dart
┃ ┃ ┃ 
┃ ┃ ┣ 📂 domain : Domain Layer
┃ ┃ ┃ ┣ 📂 entities
┃ ┃ ┃ ┃ ┗ 📜 account_entity.dart
┃ ┃ ┃ ┣ 📂 repositories
┃ ┃ ┃ ┃ ┗ 📜 account_repository.dart
┃ ┃ ┃ ┃
┃ ┃ ┃ ┗ 📂 usecases
┃ ┃ ┃   ┣ 📜 delete_account_use_case.dart
┃ ┃ ┃   ┣ 📜 get_account_use_case.dart
┃ ┃ ┃   ┗ 📜 save_account_use_case.dart
┃ ┃ ┃ 
┃ ┃ ┗ 📂 presentation : Presentation Layer
┃ ┃   ┣ 📂 pages
┃ ┃   ┃ ┗ 📜 account_page.dart
┃ ┃   ┣ 📂 viewmodels
┃ ┃   ┃ ┗ 📜 account_viewmodel.dart
┃ ┃   ┗ 📂 widgets
┃ ┃     ┗ 📜 widget.dart
┃ ┃
┃ ┗ 📂 provider : used by di.dart
┃   ┣ 📜 common_provider.dart
┃   ┣ 📜 data_source_provider.dart
┃   ┣ 📜 repository_provider.dart
┃   ┣ 📜 use_case_provider.dart
┃   ┗ 📜 viewmodel_provider.dart
┣ 📜 di.dart
┗ 📜 main.dart
```