import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

class CodeGeneratorPopup extends StatefulWidget {
  @override
  _CodeGeneratorPopupState createState() => _CodeGeneratorPopupState();
}

class _CodeGeneratorPopupState extends State<CodeGeneratorPopup> {
  late String generatedCode;

  @override
  void initState() {
    super.initState();
    generatedCode = _generateCode();
  }

  String _generateCode() {
    return randomAlphaNumeric(6);
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Code copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(13.0, 30.0, 13.0, 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generate Code',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(width: 32),
            Text(
              generatedCode,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: _copyToClipboard,
            ),
          ],
        ),
      ),
    );
  }
}
