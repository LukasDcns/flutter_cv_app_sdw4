import 'package:flutter/material.dart';

Stack imageStack(String imageName, String imageTitle) {
  return Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageName),
              )
          ),
        ),

        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    imageTitle,
                    style: const TextStyle(
                        fontFamily: 'Raleway-Bold',
                        fontSize: 20,
                        fontWeight: FontWeight.bold ,
                        color: Colors.black
                    )
                ),
              ),
            )
        ),
      ]
  );
}