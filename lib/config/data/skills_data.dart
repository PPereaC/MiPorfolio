import '../../domain/entities/skill.dart';

Skill _createSkill(String name, SkillType type) {
  return Skill(
    name: name,
    iconPath: 'assets/svgs/${name.toLowerCase().replaceAll(' ', '')}.svg',
    type: type
  );
}

List<Skill> get skills => [
  // Lenguajes de Programación
  _createSkill('Dart', SkillType.language),
  _createSkill('PHP', SkillType.language),
  _createSkill('Java', SkillType.language),
  _createSkill('C Sharp', SkillType.language),
  _createSkill('JavaScript', SkillType.language),
  _createSkill('HTML', SkillType.language),
  _createSkill('CSS', SkillType.language),
  
  // Frameworks
  _createSkill('Flutter', SkillType.framework),
  _createSkill('Laravel', SkillType.framework),
  
  // Herramientas y Software
  _createSkill('Git', SkillType.tool),
  _createSkill('Linux', SkillType.tool),
  _createSkill('Microsoft Word', SkillType.tool),
  _createSkill('API Restful', SkillType.tool),
  
  // Bases de datos
  _createSkill('MySQL', SkillType.database),
  _createSkill('Firebase', SkillType.database),
  _createSkill('Isar Database', SkillType.database),
  _createSkill('SQLite', SkillType.database),
];