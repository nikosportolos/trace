import 'package:trace/trace.dart';

void main() {
  runTraced(() {
    Trace.info('Doing some work before the exception is thrown...');
    throw Exception('🎈');
  });
}
