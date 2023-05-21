enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final TripType tripType;
  final Season season;
  final String imageUrl;
  final int duration;
  final List<String> activities;
  final List<String> program;
  final bool isInSummer;
  final bool isForFamilies;
  final bool isInWinter;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.duration,
    required this.activities,
    required this.program,
    required this.isInSummer,
    required this.isForFamilies,
    required this.isInWinter,
  });
}
