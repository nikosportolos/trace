import 'package:ansix/ansix.dart';
import 'package:trace/trace.dart';

void main() {
  runTraced(() {
    Trace.info(
      AnsiOutlinedText(
        'List of items',
        border: const AnsiBorder(),
        padding: AnsiPadding.horizontal(2),
        foregroundColor: AnsiColor.deepSkyBlue1,
        transparent: false,
      ),
    );

    Trace.printListItem('Level 1', level: 0, logLevel: LogLevel.info);
    Trace.printListItem('Level 2', level: 1, logLevel: LogLevel.info);
    Trace.printListItem('Level 3', level: 2, logLevel: LogLevel.debug);
    Trace.printListItem('Level 4', level: 3, logLevel: LogLevel.debug);
    Trace.printListItem('Level 5', level: 4, logLevel: LogLevel.verbose);
  });
}
