import 'package:flutter/material.dart';

// Supported tags: <b>, <i>, <u>, <b><i>, <i><b><u>

class RichTextData {
  RichTextData({
    required this.textWithTags,
  });

  final List<TextWithTag> textWithTags;
}

class TextWithTag {
  TextWithTag({
    this.text,
    this.style,
  });

  final String? text;

  TextStyle? style;
}

class RegexRichText {
  RichTextData textTransformation({
    required BuildContext context,
    required String text,
    Color? boldAndItalicTextColor,
    Color? boldTextColor,
    Color? italicTextColor,
    Color? underlineTextColor,
  }) {
    final regex = RegExp(r'((?:<([A-Za-z])>)+)(.*?)(?:<\/[A-Za-z]>)+');

    final matches = regex.allMatches(text);

    final richText = RichTextData(textWithTags: []);

    var currentIndex = 0;

    for (final match in matches) {
      final beforeText = text.substring(currentIndex, match.start);

      const defaultTextColor = Colors.grey;

      if (beforeText.isNotEmpty) {
        richText.textWithTags.add(
          TextWithTag(
            text: beforeText,
          ),
        );
      }

      final tags = match.group(1);

      if (tags != null) {
        var newTextStyle = const TextStyle(fontSize: 20).copyWith(
          color: defaultTextColor,
        );

        if (tags.contains('b')) {
          newTextStyle = newTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: boldAndItalicTextColor,
          );
        }

        if (tags.contains('i')) {
          newTextStyle = newTextStyle.copyWith(
            fontStyle: FontStyle.italic,
            color: boldAndItalicTextColor,
          );
        }

        if (tags.contains('u')) {
          newTextStyle = newTextStyle.copyWith(
            decoration: TextDecoration.underline,
            color: boldAndItalicTextColor,
          );
        }

        richText.textWithTags.add(
          TextWithTag(
            text: match.group(3).toString(),
            style: newTextStyle,
          ),
        );
      }

      currentIndex = match.end;
    }

    final remainingText = text.substring(currentIndex);

    if (remainingText.isNotEmpty) {
      richText.textWithTags.add(
        TextWithTag(
          text: remainingText,
        ),
      );
    }

    return richText;
  }
}
