export 'entry.dart';
export 'filter.dart';
export 'level.dart';
export 'logger.dart';
export 'rules.dart';
export 'theme.dart';

bool get isDebugMode {
  bool value = false;
  assert(() {
    value = true;
    return true;
  }());
  return value;
}
