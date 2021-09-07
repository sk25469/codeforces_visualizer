class Contest {
  final String name;
  final String phase;
  final int startTime;
  final int duration;

  Contest({
    required this.duration,
    required this.name,
    required this.phase,
    required this.startTime,
  });

  factory Contest.fromJson(Map<String, dynamic> json) {
    return Contest(
      name: json["name"],
      phase: json["phase"],
      startTime: json["startTimeSeconds"],
      duration: json["durationSeconds"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phase': phase,
      'startTimeSeconds': startTime,
      'durationSeconds': duration,
    };
  }
}