import 'package:ansix/ansix.dart';
import 'package:trace/trace.dart';

import 'mocks/mocks.dart';

void main() {
  Trace.registerLogger(
    ConsoleLogger(
      filter: DefaultLogFilter(
        LogLevel.verbose,
        debugOnly: false,
      ),
    ),
  );

  Trace.info(AnsiTreeView(
    <dynamic, dynamic>{
      'id': 123,
      'name': 'John Doe',
      'phone': '555-1234',
      'email': <String, String>{'primary': 'john.doe@email.com'},
      'age': 30,
      'groups': <String>['moderator', 'author'],
      'addresses': <Map<String, dynamic>>[
        <String, dynamic>{
          'primary': <String, dynamic>{
            'street': '123 Main St',
            'city': 'New York',
            'state': 'NY',
          },
        }
      ],
    },
    theme: AnsiTreeViewTheme(
      compact: false,
      showListItemIndex: true,
      anchorTheme: const AnsiTreeAnchorTheme(
        color: AnsiColor.deepSkyBlue5,
        style: AnsiBorderStyle.double,
      ),
      keyTheme: const AnsiTreeNodeKeyTheme(
        color: AnsiColor.white,
        textStyle: AnsiTextStyle(bold: true),
      ),
      valueTheme: const AnsiTreeNodeValueTheme(
        textStyle: AnsiTextStyle(italic: true),
        alignment: AnsiTextAlignment.center,
        color: AnsiColor.grey69,
        wrapText: true,
        wrapOptions: WrapOptions(lineLength: 120),
      ),
      headerTheme: AnsiTreeHeaderTheme(
        customHeader: 'User',
        textTheme: AnsiTextTheme(
          alignment: AnsiTextAlignment.center,
          style: const AnsiTextStyle(bold: true),
          padding: AnsiPadding.horizontal(2),
          foregroundColor: AnsiColor.white,
        ),
        border: const AnsiBorder(
          style: AnsiBorderStyle.double,
          type: AnsiBorderType.all,
          color: AnsiColor.deepSkyBlue5,
        ),
      ),
    ),
  ));

  Trace.info(
    AnsiTreeView(
      movies,
      theme: AnsiTreeViewTheme(
        headerTheme: AnsiTreeHeaderTheme(
          customHeader: 'Top 10 movies on IMDb',
          textTheme: AnsiTextTheme(
            alignment: AnsiTextAlignment.center,
            style: const AnsiTextStyle(bold: true),
            padding: AnsiPadding.symmetric(horizontal: 2, vertical: 1),
            foregroundColor: AnsiColor.white,
          ),
          border: const AnsiBorder(
            style: AnsiBorderStyle.rounded,
            type: AnsiBorderType.all,
            color: AnsiColor.darkOliveGreen5,
          ),
        ),
        anchorTheme: const AnsiTreeAnchorTheme(
          color: AnsiColor.darkOliveGreen5,
          style: AnsiBorderStyle.rounded,
        ),
        keyTheme: const AnsiTreeNodeKeyTheme(
          color: AnsiColor.white,
          textStyle: AnsiTextStyle(underline: true),
        ),
        valueTheme: const AnsiTreeNodeValueTheme(
          textStyle: AnsiTextStyle(italic: true),
          color: AnsiColor.white,
          wrapText: true,
          wrapOptions: WrapOptions(lineLength: 50),
        ),
      ),
    ),
  );
}
