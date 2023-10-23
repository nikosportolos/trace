import 'package:trace/src/progress/progress.dart';
import 'package:trace/src/trace.dart';
import 'package:trace/src/utils.dart';

void main() {
  runTraced(() {
    const ProgressIndicator fixed = FixedProgressBar(min: 1, max: 100);

    Trace.print('Progress Bar');

    Trace.startProgress(fixed);
    Trace.info('lalalalala');
    Trace.info('lalalalala');
    Trace.warning('lalalalala');
    Trace.debug('lalalalala');

    Trace.stopProgress();
  });
}
