library user_agent_parser;

class Result {
  Browser browser;
  Result({
    this.browser,
  });
}

class Browser {
  /// The browser name, set manually for a browser
  String name;

  /// The browser name, parsed directly from the user agent string without modification
  String unformattedName;

  /// The browser version
  String version;

  /// The list of regexes that can possibly parse this browser
  List<String> _regexes;

  /// The regex that was used to parse this browser
  String parsedWithRegex;

  Browser({
    this.name,
    this.unformattedName,
    this.version,
    this.parsedWithRegex,
  });

  Browser._withRegexes({
    this.name,
    regexes,
  }) {
    this._regexes = regexes;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Browser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          unformattedName == other.unformattedName &&
          version == other.version &&
          _regexes == other._regexes &&
          parsedWithRegex == other.parsedWithRegex;

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
      for (String regex in browser._regexes) {
        RegExp regExp = new RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          String unformattedName = matches.first.namedGroup('unformattedName');
          String version = matches.first.namedGroup('version');

          return Browser(
            name: browser.name,
            unformattedName: unformattedName,
            version: version,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }

  /// Identifies the different browsers that can be parsed from a user agent string.
  ///
  /// Each regex guarantees the following:
  ///    - A named group called 'unformattedName' identifies the browser name.
  ///    - A named group called 'version' identifies the browser version.
  List<Browser> _browsers = [
    Browser._withRegexes(
      name: 'Opera',
      regexes: [
        r'(?<unformattedName>opera\smini)\/(?<version>[\w\.-]+)', // Opera Mini
        r'(?<unformattedName>opera\s[mobiletab]{3,6}).+version\/(?<version>[\w\.-]+)', // Opera Mobile/Tablet
        r'(?<unformattedName>opera).+version\/(?<version>[\w\.]+)', // Opera > 9.80
        r'(?<unformattedName>opera)[\/\s]+(?<version>[\w\.]+)', //Opera < 9.80
        r'(?<unformattedName>opios)[\/\s]+(?<version>[\w\.]+)', // Opera Mini for iOS Webkit
        r'\s(?<unformattedName>opr)\/(?<version>[\w\.]+)', // Opera Webkit
      ],
    ),
    Browser._withRegexes(
      name: "Konqueror",
      regexes: [
        r'(?<unformattedName>konqueror)\/(?<version>[\w\.]+)', // Konqueror
      ],
    ),
    Browser._withRegexes(
      name: "IE",
      regexes: [
        r'(?<unformattedName>iemobile)(?:browser)?[\/\s]?(?<version>[\w\.]*)', // IEMobile
        r'(?:ms|\()(?<unformattedName>ie)\s(?<version>[\w\.]+)', // Internet Explorer
        r'(?<unformattedName>trident).+rv[:\s](?<version>[\w\.]{1,9}).+like\sgecko', // IE11
      ],
    ),
    Browser._withRegexes(
      name: "Edge",
      regexes: [
        r'(?<unformattedName>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)', // Edge
      ],
    ),
    Browser._withRegexes(
      name: 'Chrome',
      regexes: [
        r'(?<unformattedName>chrome)\/v?(?<version>[\w\.]+)', // Chrome
        r'(?<unformattedName>crmo|crios)\/(?<version>[\w\.]+)', // Chrome for iOS/iPad/Some Android
      ],
    ),
    Browser._withRegexes(
      name: 'Safari',
      regexes: [
        r'version\/(?<version>[\w\.]+)\s.*(?<unformattedName>mobile\s?safari|safari)', // Safari & Safari Mobile
      ],
    ),
    Browser._withRegexes(
      name: 'Netscape',
      regexes: [
        r'(?<unformattedName>navigator|netscape)\/(?<version>[\w\.-]+)', // Netscape
      ],
    ),
    Browser._withRegexes(
      name: 'Firefox',
      regexes: [
        r'(?<unformattedName>fxios)\/(?<version>[\w\.-]+)', // Firefox for iOS
        r'(?<unformattedName>firefox)\/(?<version>[\w\.-]+)$', // Firefox
      ],
    ),
  ];
}
