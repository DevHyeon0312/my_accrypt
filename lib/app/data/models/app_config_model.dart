class AppConfigModel {
  final bool isDarkMode;
  final bool isDebugShowPerformanceOverlay;
  final bool isDebugShowSemanticsDebugger;
  final bool isDebugShowCheckedModeBanner;
  final bool isDebugShowMaterialGrid;

  AppConfigModel({
    this.isDarkMode = false,
    this.isDebugShowPerformanceOverlay = false,
    this.isDebugShowSemanticsDebugger = false,
    this.isDebugShowCheckedModeBanner = false,
    this.isDebugShowMaterialGrid = false,
  });

  AppConfigModel copyWith({
    bool? isDarkMode,
    bool? isDebugShowPerformanceOverlay,
    bool? isDebugShowSemanticsDebugger,
    bool? isDebugShowCheckedModeBanner,
    bool? isDebugShowMaterialGrid,
  }) {
    return AppConfigModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isDebugShowPerformanceOverlay: isDebugShowPerformanceOverlay ?? this.isDebugShowPerformanceOverlay,
      isDebugShowSemanticsDebugger: isDebugShowSemanticsDebugger ?? this.isDebugShowSemanticsDebugger,
      isDebugShowCheckedModeBanner: isDebugShowCheckedModeBanner ?? this.isDebugShowCheckedModeBanner,
      isDebugShowMaterialGrid: isDebugShowMaterialGrid ?? this.isDebugShowMaterialGrid,
    );
  }
}
