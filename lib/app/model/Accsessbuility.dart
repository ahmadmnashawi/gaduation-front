class Accessibility {
  int? id;
  String? AccessibilityType;
  Accessibility({
    this.id,
    this.AccessibilityType,
  });

  Accessibility.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    AccessibilityType = json['accessibilityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['accessibilityType'] = AccessibilityType;
    return json;
  }
}
