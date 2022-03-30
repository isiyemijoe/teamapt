extension route on String {
  String generateRoute(Map<String, dynamic> data) {
    String route = this;
    data.forEach((key, value) {
      route = route.replaceFirst(':$key', '$value');
    });
    return route;
  }
}
