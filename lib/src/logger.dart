import 'package:flutter/foundation.dart';

class Logger {
  static String _logDate = "";
  static String _msgBuffer = "";

  static String get logs => _msgBuffer;

  static void _write(String msg, bool consoleOutput) {
    if (_logDate == "" || _logDate != _currentDate()) {
      _logDate = _currentDate();
      _msgBuffer += "\n";
      _msgBuffer += "\n# Logs from $_logDate #\n";
      _msgBuffer += "\n";
    }

    _msgBuffer += "$msg\n";
    if (consoleOutput || kDebugMode) {
      print(msg);
    }
  }

  static void success(String msg, [bool consoleOutput = false]) {
    _write("[SUCCESS]<${_currentTime()}>: $msg", consoleOutput);
  }

  static void warn(String msg, [bool consoleOutput = false]) {
    _write("[WARN]<${_currentTime()}>: $msg", consoleOutput);
  }

  static void info(String msg, [bool consoleOutput = false]) {
    _write("[INFO]<${_currentTime()}>: $msg", consoleOutput);
  }

  static void alert(String msg, [bool consoleOutput = false]) {
    _write("[ALERT]<${_currentTime()}>: $msg", consoleOutput);
  }

  static String _currentDate() {
    // From 2022-04-01 10:29:08.075 get 2022-04-01
    var datetime = DateTime.now().toString();
    var date = datetime.substring(0, datetime.length - 13);
    return date;
  }

  static String _currentTime() {
    // From 2022-04-01 10:29:08.075 get 10:29:08
    var datetime = DateTime.now().toString();
    var time = datetime.substring(0, datetime.length - 4).substring(11);
    return time;
  }
}
