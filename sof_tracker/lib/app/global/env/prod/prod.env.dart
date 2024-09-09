import 'package:envied/envied.dart';

import 'package:sof_tracker/app/global/env/app_env.dart';

part 'prod.env.g.dart';

@Envied(
  obfuscate: true,
  allowOptionalFields: true,
  path: AppEnvironment.productionPath,
)
final class ProductionEnvironment implements AppEnvironment {
  ProductionEnvironment();

  @override
  @EnviedField(varName: 'CORE_URL')
  final String coreUrl = _ProductionEnvironment.coreUrl;

  @override
  @EnviedField(varName: 'BUNDLE_ID')
  final String bundelId = _ProductionEnvironment.bundelId;

  @override
  @EnviedField(varName: 'APP_NAME')
  final String appName = _ProductionEnvironment.appName;
}
