import 'package:flutter/material.dart';

class PrivacyTextWidget extends StatelessWidget {
  const PrivacyTextWidget({Key? key,
    required this.text,
    required this.highlight,
    required this.style,
    required this.highlightStyle,
  })
      : super(key: key);
  final String text;
  final List<String> highlight;
  final TextStyle style;
  final TextStyle highlightStyle;

  @override
  Widget build(BuildContext context) {
    final text = this.text ?? '';
    if ((highlight.isEmpty) || text.isEmpty) {
      return Text(text, style: style);
    }

    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;
    for(var item in highlight){

      if(text.contains(item)){

      }

      do {
        indexOfHighlight = text.indexOf(item, start);
        if (indexOfHighlight < 0) {
          // no highlight
          spans.add(_normalSpan(text.substring(start)));
          break;
        }
        if (indexOfHighlight > start) {
          // normal text before highlight
          spans.add(_normalSpan(text.substring(start, indexOfHighlight)));
        }
        start = indexOfHighlight + highlight.length;
        spans.add(_highlightSpan(text.substring(indexOfHighlight, start)));
      } while (true);
    }
    return Text.rich(TextSpan(children: spans));
  }

  TextSpan _highlightSpan(String content) {
    return TextSpan(text: content, style: highlightStyle);
  }

  TextSpan _normalSpan(String content) {
    return TextSpan(text: content, style: style);
  }
}
