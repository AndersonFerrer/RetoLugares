// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String? title;
  final String? leading;
  final String? subtitle;
  final Function()? onTap;

  const CardCustom(
      {super.key, this.title, this.leading, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.only(bottom: 20),
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      subtitle!,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(leading!),
              )
            ],
          ),
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}
