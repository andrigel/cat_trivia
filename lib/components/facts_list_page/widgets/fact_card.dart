import 'package:cat_trivia/helpers/formatters/date_formatters.dart';
import 'package:cat_trivia/models/fact/fact.dart';
import 'package:flutter/material.dart';

class FactCard extends StatelessWidget {
  final Fact fact;
  const FactCard({Key? key, required this.fact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF509f93),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          title: Text(
            fact.text,
            maxLines: 2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          trailing: Text(dateTimeFormat(fact.updatedAt.toLocal()),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
