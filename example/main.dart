import 'package:user_agent_parser/user_agent_parser.dart';

void main() {
  UserAgentParser parser = UserAgentParser();

  String userAgent1 =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
  Result result = parser.parseResult(userAgent1);

  print(result.browser.name); // Chrome
  print(result.browser.version); // 87.0.4280.88
}
