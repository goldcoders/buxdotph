import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const bool buxSandbox = _Env.buxSandbox;
  static const String buxApiKey = _Env.buxApiKey;
  static const String buxClientId = _Env.buxClientId;
  static const String buxApiSecret = _Env.buxApiSecret;
}
