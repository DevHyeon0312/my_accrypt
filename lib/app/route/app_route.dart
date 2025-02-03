enum AppRoute {
  main(name: '/', canPop: false),
  debug(name: '/debug', canPop: true),
  ;

  final String name;
  final bool canPop;

  const AppRoute({
    required this.name,
    required this.canPop,
  });
}