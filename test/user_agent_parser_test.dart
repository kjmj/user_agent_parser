import 'package:flutter_test/flutter_test.dart';

import 'package:user_agent_parser/user_agent_parser.dart';

void main() {
  var parser;
  setUp(() {
    parser = UserAgentParser();
  });

  group('opera browser', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '73.0.3856.284',
        parsedWithRegex: r'\s(?<name>opr)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '73.0.3856.284',
        parsedWithRegex: r'\s(?<name>opr)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('linux', () {
      final userAgent =
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '73.0.3856.284',
        parsedWithRegex: r'\s(?<name>opr)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android (huawei)', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; VOG-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36 OPR/61.1.3076.56625';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '61.1.3076.56625',
        parsedWithRegex: r'\s(?<name>opr)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android (samsung)', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; SM-G970F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36 OPR/61.1.3076.56625';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '61.1.3076.56625',
        parsedWithRegex: r'\s(?<name>opr)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('windows version 7', () {
      final userAgent =
          'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.54 [en]';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '7.54',
        parsedWithRegex: r'(?<name>opera)[\/\s]+(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('windows version 11', () {
      final userAgent =
          'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.9.168 Version/11.50';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '11.50',
        parsedWithRegex: r'(?<name>opera).+version\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('opera mobile (presto rendering engine)', () {
      final userAgent =
          'Opera/9.80 (Android 4.1.2; Linux; Opera Mobi/ADR-1305251841) Presto/2.11.355 Version/12.10';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '12.10',
        parsedWithRegex:
            r'(?<name>opera\s[mobiletab]{3,6}).+version\/(?<version>[\w\.-]+)',
      );

      expect(actual, expected);
    });

    test('opera mini', () {
      final userAgent =
          'Opera/9.80 (J2ME/MIDP; Opera Mini/5.1.21214/28.2725; U; ru) Presto/2.8.119 Version/11.10';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '5.1.21214',
        parsedWithRegex: r'(?<name>opera\smini)\/(?<version>[\w\.-]+)',
      );

      expect(actual, expected);
    });

    test('opera mini (iOS webkit)', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) OPiOS/10.2.0.93022 Mobile/11D257 Safari/9537.53';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Opera',
        version: '10.2.0.93022',
        parsedWithRegex: r'(?<name>opios)[\/\s]+(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });
  });

  group('konqueror browser', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows; Windows i686) KHTML/4.10.2 (like Gecko) Konqueror/4.10';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Konqueror',
        version: '4.10',
        parsedWithRegex: r'(?<name>konqueror)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('linux', () {
      final userAgent =
          'Mozilla/5.0 (compatible; Konqueror/4.4; Linux) KHTML/4.4.5 (like Gecko) Kubuntu';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Konqueror',
        version: '4.4',
        parsedWithRegex: r'(?<name>konqueror)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('freeBSD', () {
      final userAgent =
          'Mozilla/5.0 (X11; FreeBSD) KHTML/4.9.1 (like Gecko) Konqueror/4.9';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Konqueror',
        version: '4.9',
        parsedWithRegex: r'(?<name>konqueror)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });
  });

  group('ie browser', () {
    test('windows xp version 8', () {
      final userAgent =
          'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'IE',
        version: '8.0',
        parsedWithRegex: r'(?:ms|\()(?<name>ie)\s(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('windows 8 version 10', () {
      final userAgent = 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2)';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'IE',
        version: '10.0',
        parsedWithRegex: r'(?:ms|\()(?<name>ie)\s(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('windows 10 version 11', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Trident/7.0; rv:11.0) like Gecko';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'IE',
        version: '11.0',
        parsedWithRegex:
            r'(?<name>trident).+rv[:\s](?<version>[\w\.]{1,9}).+like\sgecko',
      );

      expect(actual, expected);
    });

    test('ie mobile', () {
      final userAgent =
          'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; Microsoft; Lumia 950)';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'IE',
        version: '10.0',
        parsedWithRegex:
            r'(?<name>iemobile)(?:browser)?[\/\s]?(?<version>[\w\.]*)',
      );

      expect(actual, expected);
    });
  });

  group('edge browser', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.66';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Edge',
        version: '87.0.664.66',
        parsedWithRegex:
            r'(?<name>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.60';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Edge',
        version: '87.0.664.60',
        parsedWithRegex:
            r'(?<name>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('iOS', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 EdgiOS/45.11.1 Mobile/15E148 Safari/605.1.15';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Edge',
        version: '45.11.1',
        parsedWithRegex:
            r'(?<name>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; HD1913) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36 EdgA/45.11.2.5116';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Edge',
        version: '45.11.2.5116',
        parsedWithRegex:
            r'(?<name>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('windows 10 mobile', () {
      final userAgent =
          'Mozilla/5.0 (Windows Mobile 10; Android 10.0; Microsoft; Lumia 950XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Mobile Safari/537.36 Edge/40.15254.603';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Edge',
        version: '40.15254.603',
        parsedWithRegex:
            r'(?<name>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)',
      );

      expect(actual, expected);
    });
  });

  group('chrome browser', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.88',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.88',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('linux', () {
      final userAgent =
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.88',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('iPhone', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.77',
        parsedWithRegex: r'(?<name>android.+crmo|crios)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('iPad', () {
      final userAgent =
          'Mozilla/5.0 (iPad; CPU OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.77',
        parsedWithRegex: r'(?<name>android.+crmo|crios)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('iPod', () {
      final userAgent =
          'Mozilla/5.0 (iPod; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.77',
        parsedWithRegex: r'(?<name>android.+crmo|crios)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android (standard)', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.101',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android (samsung)', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; SM-A205U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.101',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('android (lg)', () {
      final userAgent =
          'Mozilla/5.0 (Linux; Android 10; LM-Q720) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '87.0.4280.101',
        parsedWithRegex: r'(?<name>chrome)\/v?(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });

    test('chrome 16 on android', () {
      final userAgent =
          'Mozilla/5.0 (Linux; U; Android-4.0.3; en-us; Xoom Build/IML77) AppleWebKit/535.7 (KHTML, like Gecko) CrMo/16.0.912.75 Safari/535.7';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Chrome',
        version: '16.0.912.75',
        parsedWithRegex: r'(?<name>android.+crmo|crios)\/(?<version>[\w\.]+)',
      );

      expect(actual, expected);
    });
  });

  group('safari browser', () {
    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.2 Safari/605.1.15';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Safari',
        version: '14.0.2',
        parsedWithRegex:
            r'version\/(?<version>[\w\.]+)\s.*(?<name>mobile\s?safari|safari)',
      );

      expect(actual, expected);
    });

    test('iPhone', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Safari',
        version: '14.0',
        parsedWithRegex:
            r'version\/(?<version>[\w\.]+)\s.*(?<name>mobile\s?safari|safari)',
      );

      expect(actual, expected);
    });

    test('iPad', () {
      final userAgent =
          'Mozilla/5.0 (iPad; CPU OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Safari',
        version: '14.0',
        parsedWithRegex:
            r'version\/(?<version>[\w\.]+)\s.*(?<name>mobile\s?safari|safari)',
      );

      expect(actual, expected);
    });

    test('iPod', () {
      final userAgent =
          'Mozilla/5.0 (iPod touch; CPU iPhone 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Safari',
        version: '14.0',
        parsedWithRegex:
            r'version\/(?<version>[\w\.]+)\s.*(?<name>mobile\s?safari|safari)',
      );

      expect(actual, expected);
    });
  });

  group('firefox browser', () {
    test('windows', () {
      final userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '84.0',
        parsedWithRegex: r'(?<name>firefox)\/(?<version>[\w\.-]+)$',
      );

      expect(actual, expected);
    });

    test('macOS', () {
      final userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 11.1; rv:84.0) Gecko/20100101 Firefox/84.0';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '84.0',
        parsedWithRegex: r'(?<name>firefox)\/(?<version>[\w\.-]+)$',
      );

      expect(actual, expected);
    });

    test('linux', () {
      final userAgent =
          'Mozilla/5.0 (X11; Linux i686; rv:84.0) Gecko/20100101 Firefox/84.0';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '84.0',
        parsedWithRegex: r'(?<name>firefox)\/(?<version>[\w\.-]+)$',
      );

      expect(actual, expected);
    });

    test('iPhone', () {
      final userAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 11_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/30.0 Mobile/15E148 Safari/605.1.15';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '30.0',
        parsedWithRegex: r'fxios\/(?<version>[\w\.-]+)',
      );

      expect(actual, expected);
    });

    test('iPad', () {
      final userAgent =
          'Mozilla/5.0 (iPad; CPU OS 11_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/30.0 Mobile/15E148 Safari/605.1.15';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '30.0',
        parsedWithRegex: r'fxios\/(?<version>[\w\.-]+)',
      );

      expect(actual, expected);
    });

    test('iPod', () {
      final userAgent =
          'Mozilla/5.0 (iPod touch; CPU iPhone OS 11_1 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) FxiOS/30.0 Mobile/15E148 Safari/605.1.15';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '30.0',
        parsedWithRegex: r'fxios\/(?<version>[\w\.-]+)',
      );

      expect(actual, expected);
    });

    test('android (standard)', () {
      final userAgent =
          'Mozilla/5.0 (Android 11; Mobile; rv:68.0) Gecko/68.0 Firefox/84.0';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '84.0',
        parsedWithRegex: r'(?<name>firefox)\/(?<version>[\w\.-]+)$',
      );

      expect(actual, expected);
    });

    test('android (lg)', () {
      final userAgent =
          'Mozilla/5.0 (Android 11; Mobile; LG-M255; rv:84.0) Gecko/84.0 Firefox/84.0';
      final actual = parser.parseBrowser(userAgent);
      final expected = Browser(
        name: 'Firefox',
        version: '84.0',
        parsedWithRegex: r'(?<name>firefox)\/(?<version>[\w\.-]+)$',
      );

      expect(actual, expected);
    });
  });
}
