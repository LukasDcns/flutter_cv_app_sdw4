class AirtableDataSkill {
  String id;
  String category;
  List<dynamic> skill;
  String createdTime;

  AirtableDataSkill({
    required this.id,
    required this.category,
    required this.skill,
    required this.createdTime,
  });
}