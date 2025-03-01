extension CaseInsensitiveMap on Map<String, dynamic> {
  dynamic getCaseInsensitive(String key) {
    return entries
        .firstWhere((entry) => entry.key.toLowerCase() == key.toLowerCase(), orElse: () => MapEntry('', null))
        .value;
  }
}

Map<String, dynamic> normalizeFirstLetterKeys(Map<String, dynamic> map) {
  return map.map((key, value) {
    final normalizedKey = key[0].toLowerCase() + key.substring(1);
    return MapEntry(normalizedKey, value);
  });
}