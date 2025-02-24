enum AppRoute {
  main(name: '/', canPop: false),
  debug(name: '/debug', canPop: true),
  accountAdd(name: '/account_add', canPop: true),
  accountAddIdPwType(name: '/account_add_id_pw_type', canPop: true),
  accountAddEmailType(name: '/account_add_email_type', canPop: true),
  accountAddSocialType(name: '/account_add_social_type', canPop: true),
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