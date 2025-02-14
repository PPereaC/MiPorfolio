import '../../domain/entities/project.dart';

List<Project> get projects => [
  Project(
    title: 'CineRadar',
    description: 'Descubre películas y guarda tus favoritas en tu propia colección personalizada.',
    imagePath: 'assets/projects/cineradar.jpeg',
    tagLabels: ['Flutter', 'Dart', 'SQLite'],
    repositoryUrl: 'https://github.com/PPereaC/CineRadar'
  ),
  Project(
    title: 'FinMusic',
    description: 'Reproductor multiplataforma de música de YouTube Music. Busca y reproduce cualquier canción o video musical de forma gratuita.',
    imagePath: 'assets/projects/finmusic.jpeg',
    tagLabels: ['Flutter', 'Dart', 'SQLite'],
    repositoryUrl: 'https://github.com/PPereaC/FinMusic'
  ),
  Project(
    title: 'Porfolio',
    description: 'Portfolio personal mostrando mis proyectos, habilidades y experiencia en desarrollo.',
    imagePath: 'assets/projects/porfolio.jpeg',
    tagLabels: ['Flutter', 'Dart'],
    repositoryUrl: 'https://github.com/PPereaC/porfolio'
  ),
];