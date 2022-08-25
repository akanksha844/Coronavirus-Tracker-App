import 'package:http/http.dart';

class LastUpdatedDateFormatter {
  LastUpdatedDateFormatter({@required this.lastUpadted});
  final DateTime lastUpdated;
  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return 'Last updated: $formatted';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessEidget {
  const LastUpdatedStatusText({Key key, this.text}) : super(key: key);
  final String text;
  @Override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
