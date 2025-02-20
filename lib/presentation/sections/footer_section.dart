import 'package:flutter/material.dart';

import '../../config/utils/device_info.dart';
import '../../generated/l10n.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);
    final isMobile = DeviceInfo(context).isMobile;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: isMobile
        ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  locale.madeWithFlutter,
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
            const SizedBox(height: 8),
            Text(
              '© ${DateTime.now().year} Pablo Perea Campos.',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      : Row(
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
                    locale.footerRightsReserved,
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
                  locale.madeWithFlutter,
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
        )
    );
  }
}