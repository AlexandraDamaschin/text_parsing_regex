import 'package:flutter/material.dart';
import 'package:text_parsing_regex/rich_text_data.dart';

// Example of usage:
//  CustomRichText(
//       richTextData: RegexRichText().textTransformation(
//       context: context,
//       text:
//          'Some text <b>BOLD</b>, <i>italic</i> and <b><i>bold and italic</i></b> and <b><i><u> bold and italic and underline</b></i></u>  and <i><u><b> italic and underline and bold</i></u></b>',
//        ),
//  ),

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.richTextData,
    Key? key,
  }) : super(key: key);

  final RichTextData richTextData;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle =
        const TextStyle(fontSize: 20).copyWith(color: Colors.grey);

    final widgets = <InlineSpan>[];

    for (final rt in richTextData.textWithTag) {
      widgets.add(
        TextSpan(
          text: rt.text,
          style: rt.style ?? defaultTextStyle,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: widgets,
      ),
    );
  }
}
