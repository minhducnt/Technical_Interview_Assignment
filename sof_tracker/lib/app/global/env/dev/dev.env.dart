import 'package:envied/envied.dart';

import 'package:sof_tracker/app/global/env/app_env.dart';

part 'dev.env.g.dart';

@Envied(
  obfuscate: true,
  allowOptionalFields: true,
  path: AppEnvironment.developmentPath,
)
final class DevelopmentEnvironment implements AppEnvironment {
  DevelopmentEnvironment();

  @override
  @EnviedField(varName: 'CORE_URL')
  final String coreUrl = _DevelopmentEnvironment.coreUrl;

  @override
  @EnviedField(varName: 'BUNDLE_ID')
  final String bundelId = _DevelopmentEnvironment.bundelId;

  @override
  @EnviedField(varName: 'APP_NAME')
  final String appName = _DevelopmentEnvironment.appName;
}
