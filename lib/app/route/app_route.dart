enum AppRoute {
  main(name: '/', canPop: false),
  debug(name: '/debug', canPop: true),
  accountAdd(name: '/account_add', canPop: true),
  ;

  final String name;
  final bool canPop;

  const AppRoute({
    required this.name,
    required this.canPop,
  });

  static AppRoute findRouteByName(String name) {
    return AppRoute.values.firstWhere((element) => element.name == name, orElse: () => AppRoute.main);
  }
}