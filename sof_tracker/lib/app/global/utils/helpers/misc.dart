import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

bool isNullOrEmpty(dynamic input) {
  var localInput = input;
  if (localInput is String) localInput = localInput.trim();
  return GetUtils.isNullOrBlank(localInput) ?? true;
}

String isStringEmpty(String? input, {String? errorMessage}) {
  if (isNullOrEmpty(input)) return errorMessage ?? '';
  return input ?? '';
}

String getUTCDateTime(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final utcDate = date.toUtc().toString();
  return Jiffy.parse(utcDate).yMMMMd;
}
