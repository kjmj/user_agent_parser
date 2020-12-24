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
  List<String> regexes; // TODO make this private

  Browser({this.name, this.version});
  Browser.withRegex({this.name, this.regexes}); // TODO make this private

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
    for (Browser browser in _browsers) {
      for (String regex in browser.regexes) {
        RegExp regExp = new RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          String version = matches.first.namedGroup('version');

          return new Browser(
            name: browser.name,
            version: version,
          );
        }
      }
    }

    return null;
  }

  /// Identifies the different browsers that can be parsed from a user agent string.
  ///
  /// Each regex guarantees the following:
  ///    - A named group called "name" identifies the browser name.
  ///    - A named group called "version" identifies the browser version.
  ///
  ///  TODO: Add support for Firefox, IE, Konqueror, Netscape, Opera, and Safari
  ///  TODO test that the "name" group is being parsed correctly
  List<Browser> _browsers = [
    Browser.withRegex(
      name: 'Chrome',
      regexes: [
        r"(?<name>chrome)\/v?(?<version>[\w\.]+)", // Chrome
        r"(?<name>android.+crmo|crios)\/(?<version>[\w\.]+)", // Chrome for Android/iOS/iPad
      ],
    ),
  ];
}
