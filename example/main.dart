import 'package:user_agent_parser/user_agent_parser.dart';

void main() {
  UserAgentParser parser = UserAgentParser();

  String userAgent1 =
      'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
  Result result = parser.parseResult(userAgent1);

  print(result.browser.name); // Chrome
  print(result.browser.unformattedName); // CriOS
  print(result.browser.version); // 87.0.4280.77
  print(result.browser
      .parsedWithRegex); // r'(?<unformattedName>crmo|crios)\/(?<version>[\w\.]+)'
}
