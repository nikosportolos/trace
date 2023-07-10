import 'package:ansix/ansix.dart';
import 'package:trace/trace.dart';

void main() {
  Trace.registerLogger(ConsoleLogger());

  Trace.info(
    AnsiTreeView(
      theme: AnsiTreeViewTheme.$default(),
    ).format(
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
    ),
  );
}
