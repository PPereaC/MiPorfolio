import '../../domain/entities/project.dart';
import '../../generated/l10n.dart';

List<Project> getProjects(AppLocalizations l10n) => [
  Project(
    title: 'CineRadar',
    description: l10n.projectCineradarDescription,
    imagePath: 'assets/projects/cineradar.jpeg',
    tagLabels: ['Flutter', 'Dart', 'SQLite'],
    repositoryUrl: 'https://github.com/PPereaC/CineRadar'
  ),
  Project(
    title: 'FinMusic',
    description: l10n.projectFinmusicDescription,
    imagePath: 'assets/projects/finmusic.jpeg',
    tagLabels: ['Flutter', 'Dart', 'SQLite'],
    repositoryUrl: 'https://github.com/PPereaC/FinMusic'
  ),
  Project(
    title: 'Porfolio',
    description: l10n.projectPortfolioDescription,
    imagePath: 'assets/projects/porfolio.jpeg',
    tagLabels: ['Flutter', 'Dart'],
    repositoryUrl: 'https://github.com/PPereaC/porfolio'
  ),
];