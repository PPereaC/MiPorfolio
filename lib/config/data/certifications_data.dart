import '../../domain/entities/certification.dart';

List<Certification> get certifications => [

  Certification(
    name: 'Flutter - Móvil: De cero a experto',
    platform: 'Udemy',
    instructor: 'Fernando Herrera',
    certificateUrl: 'https://www.udemy.com/certificate/UC-6629643b-0acb-4a56-a97c-8d6ff582786a',
    certificationImage: 'assets/certifications/flutter.jpg',
    platformLogo: 'assets/svgs/udemy_logo.svg',
    courseImage: 'assets/certifications/course_flutter.png',
  ),

  Certification(
    name: 'Aprende Java con 100 ejercicios prácticos (Incluye JavaFX)',
    platform: 'Udemy',
    instructor: 'Disco Duro de Roer',
    certificateUrl: 'https://www.udemy.com/certificate/UC-e746b2a6-38b7-4aee-a581-7558faabc2a1',
    certificationImage: 'assets/certifications/java.pdf',
    platformLogo: 'assets/svgs/udemy_logo.svg',
    courseImage: 'assets/certifications/course_java.png',
  ),

];