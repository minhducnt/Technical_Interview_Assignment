import 'package:envied/envied.dart';

import 'package:sof_tracker/app/global/env/app_env.dart';

part 'stg.env.g.dart';

@Envied(
  obfuscate: true,
  allowOptionalFields: true,
  path: AppEnvironment.stagingPath,
)
final class StagingEnvironment implements AppEnvironment {
  StagingEnvironment();

  @override
  @EnviedField(varName: 'CORE_URL')
  final String coreUrl = _StagingEnvironment.coreUrl;

  @override
  @EnviedField(varName: 'BUNDLE_ID')
  final String bundelId = _StagingEnvironment.bundelId;

  @override
  @EnviedField(varName: 'APP_NAME')
  final String appName = _StagingEnvironment.appName;
}
