import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  '© ${DateTime.now().year} Pablo Perea Campos.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'Casi todos los derechos reservados',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'Hecho con Flutter',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 4),
              const FlutterLogo()
            ],
          ),
        ],
      ),
    );
  }
}