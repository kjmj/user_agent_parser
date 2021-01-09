library user_agent_parser;

import 'package:user_agent_parser/parsers/browser_parser.dart';
import 'package:user_agent_parser/results/browser.dart';
import 'package:user_agent_parser/results/result.dart';

export 'package:user_agent_parser/results/browser.dart';
export 'package:user_agent_parser/results/result.dart';

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
    for (BrowserParser browserParser in browserParsers) {
      for (String regex in browserParser.regexes) {
        RegExp regExp = new RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          String unformattedName = matches.first.namedGroup('unformattedName');
          String version = matches.first.namedGroup('version');

          return Browser(
            name: browserParser.name,
            unformattedName: unformattedName,
            version: version,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }
}
