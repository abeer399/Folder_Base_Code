import 'package:logger/logger.dart';

//? Custom logger
final Logger logs = Logger(
  printer: AppCustomLogPrinter("[---Logger---]"),
  // Customize the log levels based on your needs
  // level: Level.debug,
);

class AppCustomLogPrinter extends LogPrinter {
  final String className;
  AppCustomLogPrinter(this.className);

  @override
  List<String> log(event) {
    var color = event.level.name == "info"
        ? const AnsiColor.fg(226)
        : PrettyPrinter.defaultLevelColors[event.level];
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    return [color!('$emoji $className ${event.message}')];
  }
}


// ? Normal functions of logger
// class AppLoggerHelper {
//   AppLoggerHelper._();

//   static final Logger _logger = Logger(
//     printer: PrettyPrinter(
//       methodCount: 0,
//       // errorMethodCount: 3,
//       // lineLength: 50,
//       colors: true,
//       printEmojis: true,
//       printTime: true,
//     ),
//     // Customize the log levels based on your needs
//     // level: Level.debug,
//   );

//   static void trace(String message) {
//     _logger.t(message);
//   }

//   static void debug(String message) {
//     _logger.d(message);
//   }

//   static void info(String message) {
//     _logger.i(message);
//   }

//   static void warning(String message) {
//     _logger.w(message);
//   }

//   static void error(String message, [dynamic error]) {
//     _logger.e(message, error: error);
//   }

//   static void fatal(String message, [dynamic error, dynamic stackTrace]) {
//     _logger.f(message, error: error, stackTrace: stackTrace);
//   }
// }

