class Browser {
  /// The browser name, set manually for a browser
  String name;

  /// The browser name, parsed directly from the user agent string without modification
  String unformattedName;

  /// The browser version
  String version;

  /// The regex that was used to parse this browser
  String parsedWithRegex;

  Browser({
    this.name,
    this.unformattedName,
    this.version,
    this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Browser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          unformattedName == other.unformattedName &&
          version == other.version &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => name.hashCode ^ version.hashCode;
}
