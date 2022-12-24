class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.LOCAL;
  static final List<AppConfig> _availableEnvironments = [
    AppConfig(
      env: Environments.LOCAL,
      url: 'http://localhost:8080/api/',
    ),
    AppConfig(
      env: Environments.DEV,
      url: 'http://localhost:8080/api/',
    ),
    AppConfig(
      env: Environments.QAS,
      url: 'http://localhost:8080/api/',
    ),
    AppConfig(
      env: Environments.PRODUCTION,
      url: 'http://localhost:8080/api/',
    ),
  ];

  static AppConfig getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d.env == _currentEnvironments,
    );
  }
}

class AppConfig {
  String env;
  String url;

  AppConfig({
    required this.env,
    required this.url,
  });
}
