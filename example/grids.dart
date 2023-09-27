import 'package:ansix/ansix.dart';
import 'package:collection/collection.dart';
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

  final List<List<Object?>> rows = <List<Object?>>[
    <Object?>['#', 'Title', 'Release Year', 'IMDb Rate'],
    ...movies.mapIndexed((int i, Movie m) {
      return <Object>[i + 1, m.title, m.releaseYear, m.rate];
    }).toList(growable: false),
    <Object?>['Average', '', '', movies.map((Movie m) => m.rate).toList(growable: false).average],
  ];

  Trace.info('This is a random data grid');
  Trace.debug(AnsiGrid.fromRows(rows, theme: gridTheme));
}
