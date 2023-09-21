part of 'section.dart';

/// **TimestampFormatter**
///
/// Formats [Timestamp] input with Ansi formatter.
///
/// [timestampFormat] accepts the following standard notations:
///
/// `d` : Day of month (01 - 31)
///
/// `j` : Day of month, without leading 0s (1 - 31)
///
/// `D` : An abbreviated textual representation of a day (Mon - Sun)
///
/// `l` : A textual representation of a day (Monday - Sunday)
///
/// `S` : Suffix of a day (st, th, nd)
///
/// `z` : The day of the year (starting from 0)
///
/// `F` : A textual representation of a month (January - December)
///
/// `M` : An abbreviated textual representation of a month (Jan - Dec)
///
/// `m` : Numeric representation of a month (01 - 12)
///
/// `n` : Numeric representation of a month, without leading 0s (1 - 12)
///
/// `Y` : Full numeric representation of a year (e.g. 2019)
///
/// `y` : A two digit representation of a year (e.g. 19)
///
/// `a` : Ante meridiem and post meridiem, lowercase (am or pm)
///
/// `A` : Ante meridiem and post meridiem, uppercase (AM or PM)
///
/// `g` : 12-hour format of an hour, without leading 0s (1 - 12)
///
/// `h` : 12-hour format of an hour (01 - 12)
///
/// `G` : 24-hour format of an hour, without leading 0s (0 - 23)
///
/// `H` : 24-hour format of an hour (00 - 23)
///
/// `i` : Minutes (0 - 59)
///
/// `s` : Seconds (0 - 59)
///
/// `v` : Milliseconds (0 - 999)
///
/// `u` : Microseconds (0 - 999)
///
/// `e` : System time zone identifier (Returns [DateTime.timeZoneName], which
/// is provided by the operating system and may be a name or abbreviation.)
///
/// `O` : Difference to Greenwich Time (GMT) in hours (±0000)
///
/// `P` : Difference to Greenwich Time (GMT) in hours with a colon (±00:00)
///
/// `T` : Time zone abbreviation (Identifies the time zone from
/// [DateTime.timeZoneName].)
///
/// `c` : ISO 8601 date (e.g. 2019-10-15T19:42:05-08:00)
///
/// `r` : RFC 2822 date (Tue, 15 Oct 2019 17:42:05 -0800)
///
/// `U` : Seconds since Unix Epoch
///
/// `\` : Escape character
///
/// __See:__ [DateTimeFormats] for common formatting notations.
class TimestampFormatter extends LogSectionFormatter {
  const TimestampFormatter();

  @override
  String format(final LoggerTheme theme, final LogEntry entry) {
    return AnsiText.withTheme(
      DateTimeFormat.format(entry.timestamp, format: theme.timestampFormat),
      getTextThemeForSection(theme, entry.level, LogSection.timestamp),
    ).formattedText;
  }
}
