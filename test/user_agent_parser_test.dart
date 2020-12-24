import 'package:flutter_test/flutter_test.dart';

import 'package:user_agent_parser/user_agent_parser.dart';

void main() {
  var parser;
  setUp(() {
    parser = UserAgentParser();
  });

  group('chrome browser on', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.88');

      expect(actual, expected);
    });

    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.88');

      expect(actual, expected);
    });

    test('linux', () {
      final userAgent =
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.88');

      expect(actual, expected);
    });

    test('iPhone', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.77');

      expect(actual, expected);
    });

    test('iPad', () {
      final userAgent =
          'Mozilla/5.0 (iPad; CPU OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.77');

      expect(actual, expected);
    });

    test('iPod', () {
      final userAgent =
          'Mozilla/5.0 (iPod; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.77');

      expect(actual, expected);
    });

    test('android standard', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.101');

      expect(actual, expected);
    });

    test('android samsung', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; SM-A205U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.101');

      expect(actual, expected);
    });

    test('android lg', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; LM-Q720) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = new Browser(name: 'Chrome', version: '87.0.4280.101');

      expect(actual, expected);
    });
  });
}
