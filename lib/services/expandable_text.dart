// expandable_text.dart

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ExpandableText(this.text, {this.maxLength = 100});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isOverFlowText = widget.text.length > widget.maxLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isOverFlowText && !_isExpanded
              ? widget.text.substring(0, widget.maxLength) + '...'
              : widget.text,
          style: TextStyle(fontSize: 16),
        ),
        if (isOverFlowText)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? ' Show less' : ' Show more',
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
