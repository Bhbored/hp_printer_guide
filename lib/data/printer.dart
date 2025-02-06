class Printer {
  const Printer( this.title, this.overview, this.features, this.pros,
      this.manualOverview, this.cons, this.tip);
  final String title;
  final String overview;
  final List<String> features;
  final List<String> pros;
  final List<String> cons;
  final List<String> manualOverview;
  final String tip;
}
