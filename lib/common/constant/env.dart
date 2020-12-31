class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('http://192.168.28.34:8765/api');
  static final Env staging = Env('http://192.168.28.34:8765/api');
  static final Env production = Env('http://192.168.28.34:8765/api');
}
