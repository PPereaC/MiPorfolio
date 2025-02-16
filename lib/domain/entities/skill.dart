class Skill {
  final String name;
  final String iconPath;
  final SkillType type;

  const Skill({
    required this.name, 
    required this.iconPath,
    required this.type
  });
}

enum SkillType {
  language,
  framework,
  tool,
  database
}