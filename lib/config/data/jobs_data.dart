import '../../domain/entities/job.dart';
import '../../generated/l10n.dart';

List<Job> getJobs(AppLocalizations l10n) => [
  Job(
    company: 'SUPERMERCADO LAS PALMERAS S.L',
    position: 'Desarrollador de software',
    period: 'oct. 2024 - nov. 2024 (2 meses) | Contrato por obra o servicio',
    description: l10n.jobSupermarketDescription,
    technologies: ['Flutter', 'Isar Database', 'Microsoft Word'],
    companyUrl: '',
  ),
  Job(
    company: 'VICENTE NAVAS S.L',
    position: 'Desarrollador de aplicaciones',
    period: 'jul. 2024 - ago. 2024 (2 meses) | Contrato por obra o servicio',
    description: l10n.jobVicenteNavasDescription,
    technologies: ['Flutter', 'Firebase'],
    companyUrl: 'https://www.vicentenavassl.com/',
  ),
  Job(
    company: 'DELTANET SISTEMAS DE INFORMACIÓN',
    position: 'Desarrollador de aplicaciones móviles y web',
    period: 'abr. 2024 - jun. 2024 (3 meses) | Prácticas en empresa',
    description: l10n.jobDeltanetDescription,
    technologies: ['Flutter', 'Firebase', 'PHP', 'Laravel', 'MySQL', 'API RESTful'],
    companyUrl: 'https://www.deltanet.es/',
  ),
];