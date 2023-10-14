import 'package:ansix/ansix.dart';
import 'package:data_class_plugin/data_class_plugin.dart';

part 'mocks.gen.dart';

@DataClass(toJson: true)
abstract class Movie {
  const Movie.ctor();

  /// Default constructor
  const factory Movie({
    required String title,
    required int releaseYear,
    required double rate,
  }) = _$MovieImpl;

  String get title;

  int get releaseYear;

  double get rate;

  /// Converts [Movie] to a [Map] json
  Map<String, dynamic> toJson();
}

const List<Movie> movies = <Movie>[
  Movie(title: 'The Shawshank Redemption', releaseYear: 1994, rate: 9.3),
  Movie(title: 'The Godfather', releaseYear: 1972, rate: 9.2),
  Movie(title: 'The Dark Knight', releaseYear: 2008, rate: 9.0),
  Movie(title: 'The Godfather Part II', releaseYear: 1974, rate: 9.0),
  Movie(title: '12 Angry Men', releaseYear: 1957, rate: 9.0),
  Movie(title: 'Schindler\'s List', releaseYear: 1993, rate: 9.0),
  Movie(
      title: 'The Lord of the Rings: The Return of the King',
      releaseYear: 2003,
      rate: 9.0),
  Movie(title: 'Pulp Fiction', releaseYear: 1994, rate: 8.9),
  Movie(
      title: 'The Lord of the Rings: The Fellowship of the Ring',
      releaseYear: 2001,
      rate: 8.8),
  Movie(title: 'The Good, the Bad and the Ugly', releaseYear: 1966, rate: 8.8),
];

final AnsiGridTheme gridTheme = AnsiGridTheme(
  border: const AnsiBorder(
    style: AnsiBorderStyle.rounded,
    type: AnsiBorderType.all,
  ),
  wrapText: true,
  wrapOptions: const WrapOptions(
    lineBreak: false,
    splitWords: false,
    lineLength: 15,
  ),
  orientation: AnsiOrientation.vertical,
  keepSameWidth: false,
  headerTextTheme: AnsiTextTheme(
    foregroundColor: AnsiColor.white,
    style: const AnsiTextStyle(bold: true),
    backgroundColor: AnsiColor.deepSkyBlue7,
    alignment: AnsiTextAlignment.center,
    padding: AnsiPadding.symmetric(vertical: 1, horizontal: 1),
  ),
  cellTextTheme: AnsiTextTheme(
    foregroundColor: AnsiColor.cadetBlue,
    alignment: AnsiTextAlignment.center,
    padding: AnsiPadding.horizontal(1),
  ),
  footerTextTheme: AnsiTextTheme(
    foregroundColor: AnsiColor.grey0,
    style: const AnsiTextStyle(italic: true),
    alignment: AnsiTextAlignment.center,
    backgroundColor: AnsiColor.deepSkyBlue5,
    padding: AnsiPadding.horizontal(1),
  ),
);
