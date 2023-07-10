import 'package:ansix/ansix.dart';
import 'package:trace/trace.dart';

void main() {
  Trace.registerLogger(ConsoleLogger());

  Trace.info('This is a random data table');
  Trace.debug(
    AnsiTable.fromMap(
      <Object, List<Object?>>{
        'Column 1'.styled(
          const AnsiTextStyle(
            bold: true,
            boldUnderline: true,
          ),
        ): <String>[
          'Line 11',
          'Line 12',
          'Line 13',
          'Line 14',
          'Line 15',
        ],
        'Column 2'.styled(
          const AnsiTextStyle(
            bold: true,
            boldUnderline: true,
          ),
        ): <String>[
          'Line 21',
          'Line 22',
          'Line 23',
          'Line 24',
          'Line 25',
        ],
      },
      border: const AnsiBorder(
        style: AnsiBorderStyle.rounded,
        type: AnsiBorderType.all,
        color: AnsiColor.white,
      ),
      fixedWidth: 15,
      transparent: true,
    ),
  );
}
