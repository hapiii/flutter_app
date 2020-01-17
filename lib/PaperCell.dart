import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';

class PaperCell{

  cellWithString(String str){
    return new  Html(
      data: str,
      //Optional parameters:
      padding: EdgeInsets.all(8.0),
      backgroundColor: Colors.white70,
      defaultTextStyle: TextStyle(fontFamily: 'serif'),
      linkStyle: const TextStyle(
        color: Colors.redAccent,
      ),
      onLinkTap: (url) {
        // open url in a webview
      },
      onImageTap: (src) {
        // Display the image in large form.
      },
      //Must have useRichText set to false for this to work.

    );
  }
}