import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

Widget buildHelpSection() {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Help?",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: clBlack),
          ),
          Text(
            "Get to know how your campaign",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            "can reach a wider audience",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: cl000000.withOpacity(0.10),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
              border: Border.all(color: Colors.grey),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: clFFFFFF,
                foregroundColor: clFFFFFF.withOpacity(0.15),
                backgroundColor: clFFFFFF,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Contact Us",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}