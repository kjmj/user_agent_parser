class BrowserParser {
  /// The browser name, set manually for a browser
  String name;

  /// The list of regexes that can possibly parse this browser
  List<String> regexes;

  BrowserParser({
    this.name,
    this.regexes,
  });
}

/// Identifies the different browsers that can be parsed from a user agent string.
///
/// Each regex guarantees the following:
///    - A named group called 'unformattedName' identifies the browser name.
///    - A named group called 'version' identifies the browser version.
List<BrowserParser> browserParsers = [
  BrowserParser(
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
  BrowserParser(
    name: "Konqueror",
    regexes: [
      r'(?<unformattedName>konqueror)\/(?<version>[\w\.]+)', // Konqueror
    ],
  ),
  BrowserParser(
    name: "IE",
    regexes: [
      r'(?<unformattedName>iemobile)(?:browser)?[\/\s]?(?<version>[\w\.]*)', // IEMobile
      r'(?:ms|\()(?<unformattedName>ie)\s(?<version>[\w\.]+)', // Internet Explorer
      r'(?<unformattedName>trident).+rv[:\s](?<version>[\w\.]{1,9}).+like\sgecko', // IE11
    ],
  ),
  BrowserParser(
    name: "Edge",
    regexes: [
      r'(?<unformattedName>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)', // Edge
    ],
  ),
  BrowserParser(
    name: 'Chrome',
    regexes: [
      r'(?<unformattedName>chrome)\/v?(?<version>[\w\.]+)', // Chrome
      r'(?<unformattedName>crmo|crios)\/(?<version>[\w\.]+)', // Chrome for iOS/iPad/Some Android
    ],
  ),
  BrowserParser(
    name: 'Safari',
    regexes: [
      r'version\/(?<version>[\w\.]+)\s.*(?<unformattedName>mobile\s?safari|safari)', // Safari & Safari Mobile
    ],
  ),
  BrowserParser(
    name: 'Netscape',
    regexes: [
      r'(?<unformattedName>navigator|netscape)\/(?<version>[\w\.-]+)', // Netscape
    ],
  ),
  BrowserParser(
    name: 'Firefox',
    regexes: [
      r'(?<unformattedName>fxios)\/(?<version>[\w\.-]+)', // Firefox for iOS
      r'(?<unformattedName>firefox)\/(?<version>[\w\.-]+)$', // Firefox
    ],
  ),
];
