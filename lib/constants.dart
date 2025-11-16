import 'package:flutter/material.dart';

class Airpods {
  static List<Map<String, dynamic>> airpodsList = [
    {
      'name': 'Apple AirPods 4 Pro',
      'brand': 'Apple',
      'rating': 4.8,
      'reviews': 356,
      'price': 24900.99,
      'color': Colors.black.withAlpha(180),
      'gradient': [Color.fromARGB(255, 144, 142, 142), Color(0xFFFFFFFF)],
      'description':
          'Seamless sound, smarter connection — powered by the new H2 chip.',
      'shortDescription': 'Adaptive audio and up to 30 hours of battery life.',
      'specifications': {
        'Battery Life': '30 hours',
        'Noise Cancellation': 'Active',
      },
      'url': 'assets/airpods.png',
    },
    {
      'name': 'Anker Soundcore Liberty 4',
      'brand': 'Anker',
      'rating': 4.6,
      'reviews': 212,
      'price': 12900.99,
      'color': Colors.white,
      'gradient': [
        Color.fromARGB(255, 2, 72, 159),
        Color.fromARGB(255, 0, 191, 255),
      ],
      'description':
          'Immersive spatial audio with heart rate tracking and adaptive noise canceling.',
      'shortDescription': 'Spatial audio and up to 28 hours of playtime.',
      'specifications': {
        'Battery Life': '28 hours',
        'Noise Cancellation': 'Adaptive',
      },
      'url': 'assets/anker.png',
    },
    {
      'name': 'Sennheiser MTW4',
      'brand': 'Sennheiser',
      'rating': 4.9,
      'reviews': 124,
      'price': 34900.99,
      'color': Colors.black.withAlpha(180),
      'gradient': [Color.fromARGB(255, 212, 157, 29), Color(0xFFFBD786)],
      'description':
          'Audiophile-grade sound with elegant design and adaptive ANC.',
      'shortDescription': 'Premium sound and adaptive ANC.',
      'specifications': {
        'Battery Life': '30 hours',
        'Noise Cancellation': 'Adaptive ',
      },
      'url': 'assets/mtw4.png',
    },
    {
      'name': 'Google Pixel Buds Pro',
      'brand': 'Google',
      'rating': 4.7,
      'reviews': 298,
      'price': 19900.99,
      'color': Colors.white,
      'gradient': [Color(0xFF56ab2f), Color(0xFFa8e063)], // Green gradient

      'description':
          'Clear sound, smart noise cancellation, and deep Google Assistant integration.',
      'shortDescription':
          'Balanced sound with ANC and real-time translation support.',
      'specifications': {
        'Battery Life': '31 hours',
        'Noise Cancellation': 'Active',
      },
      'url': 'assets/google.png',
    },
  ];
}
