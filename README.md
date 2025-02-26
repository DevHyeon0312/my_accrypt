# Project Description
- This app is designed to record and manage multiple accounts in one place.

# Dependencies
`Riverpod(hooks) , Dio, Freezed, Shared Preferences, ...`

# Flutter MVVM + Clean Architecture
```
  [ Presentation Layer ]                 [ Domain Layer ]     [ Data Layer ]
UI(View)    ⬄   ViewModel   ⬄     UseCase       ⬄    Repository  ⬄    DataSource
    |               |            |        |            |      |             |
  UiModel        UiModel      UiModel   Entity      Entity  Model        Model(Local DB Entity, API Request, API Response)
  
Presentation Layer : UI/UX 등 사용자와 상호작용하는 화면을 담당하는 계층. - Domain Layer 에 의존 가능하다.
Domain Layer : 앱의 핵심 비즈니스 로직을 담당하는 계층 - 다른 계층에 의존해선 안된다.
Data Layer : 외부 데이터 소스와 통신하거나 로컬 데이터를 처리하는 계층. - Domain Layer , External Layer 에 의존 가능하다.
External Layer: 외부 라이브러리나 서비스와 통신하는 계층. - 다른 계층에 의존해선 안된다.
  
UiModel : UI / UX 에 사용되는 데이터 구조
Entity : 도메인 계층의 핵심 엔티티로, 비즈니스 로직에 사용되는 순수 데이터 구조.
    - Persistence Entity 와 다르다. 여긴 Domain Entity 다.
Model : 데이터 계층에서 API 데이터, 로컬 데이터를 처리할 때 사용.
    - API Request, API Response, Local DB Entity (JPA 의 Persistence Entity 와 유사) 등

* DTO 는 데이터 전달을 위한 데이터 구조 이므로 필요에 따라 사용한다.
  1. 화면 간 데이터 전달
  2. 네트워크 통신을 위한 데이터 전달 (Model 을 Request, Response DTO 로 최적화)
  3. 파일에 저장되는 데이터 전달 (CSV, JSON, XML 등 파일 형식에 맞게 DTO 생성)
  4. 그 외 다양한 데이터 전달
```

  
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
┃ ┃ ┃ ┣ 📂 enums
┃ ┃ ┃ ┃ ┗ 📜 account_type.dart
┃ ┃ ┃ ┣ 📂 repositories
┃ ┃ ┃ ┃ ┗ 📜 account_repository.dart
┃ ┃ ┃ ┗ 📂 usecases
┃ ┃ ┃   ┗ 📜 account_usecase.dart
┃ ┃ ┃ 
┃ ┃ ┗ 📂 presentation : Presentation Layer
┃ ┃   ┣ 📂 pages
┃ ┃   ┃ ┗ 📜 account_page.dart
┃ ┃   ┣ 📂 ui_models
┃ ┃   ┃ ┣ 📜 account_ui_model.dart
┃ ┃   ┣ 📂 viewmodels
┃ ┃   ┃ ┗ 📜 account_viewmodel.dart
┃ ┃   ┗ 📂 widgets
┃ ┃     ┗ 📜 widget.dart
┃ ┃
┃ ┗ 📂 provider : used by di.dart
┃   ┣ 📜 data_source_provider.dart
┃   ┣ 📜 repository_provider.dart
┃   ┣ 📜 use_case_provider.dart
┃   ┗ 📜 viewmodel_provider.dart
┣ 📜 di.dart
┗ 📜 main.dart
```