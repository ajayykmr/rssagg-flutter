import 'package:url_launcher/url_launcher.dart';


void openUrl(String url) async {
  final uri = Uri.parse(url);
  launchUrl(uri, mode: LaunchMode.inAppBrowserView);
}