library user_agent_parser;

class Result {
  Browser browser;
  Result({
    this.browser,
  });
}

class Browser {
  String name;
  String version;

  Browser({this.name, this.version});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Browser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          version == other.version;

  @override
  int get hashCode => name.hashCode ^ version.hashCode;
}

class UserAgentParser {
  /// Parse a [Result] from the [userAgent] string.
  ///
  /// TODO: Add other types (engine, os, device, cpu) into [Result]
  Result parseResult(String userAgent) {
    return Result(
      browser: parseBrowser(userAgent),
    );
  }

  /// Parse a [Browser] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  Browser parseBrowser(String userAgent) {
    for (MapEntry mapEntry in _browsers.entries) {
      String name = mapEntry.key;
      List<String> regexes = mapEntry.value;

      for (String regex in regexes) {
        RegExp regExp = new RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          final match = regExp.firstMatch(userAgent).group(0);

          return new Browser(
            name: name,
            version: match.split('/')[1],
          );
        }
      }
    }

    return null;
  }

  /// Identifies the regexes for each browser.
  ///
  /// Key is the browser name.
  ///    - ex. 'Chrome'
  /// Value is a list of regex strings such that when matched with a user agent string,
  /// it will return a match of the format `name/version`
  ///    - ex. 'Chrome/87.0.4280.88'
  ///
  ///  TODO: Add support for Firefox, IE, Konqueror, Netscape, Opera, and Safari
  final _browsers = <String, List<String>>{
    'Chrome': [
      r"chrome\/v?([\w\.]+)", // Chrome
      r"((?:android.+)crmo|crios)\/([\w\.]+)", // Chrome for Android/iOS/iPad
    ],
  };
}
