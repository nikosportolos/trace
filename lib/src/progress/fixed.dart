import 'package:trace/src/progress/progress.dart';
import 'package:trace/src/trace.dart';

class FixedProgressBar extends ProgressIndicator {
  const FixedProgressBar({
    this.min = 0,
    this.max = 100,
    super.stopOnError,
  });

  final double min;
  final double max;

  void update(final double progress) {
    Trace.print();
  }
}
