abstract interface class AppEnvironment {
  static const String stagingPath = 'configs/.env.stg';
  static const String developmentPath = 'configs/.env.dev';
  static const String productionPath = 'configs/.env.prod';

  abstract final String bundelId;
  abstract final String appName;
  abstract final String coreUrl;
}
