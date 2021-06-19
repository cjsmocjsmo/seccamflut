import 'package:flutter/material.dart';
import 'cards/eventscard.dart';
import 'cards/healthcard.dart';

import 'cards/pingcard.dart';

import 'cards/pc1lastmotioncard.dart';
import 'cards/pc2lastmotioncard.dart';

import 'cards/pc1laststillcard.dart';
import 'cards/pc2laststillcard.dart';


import 'cards/pc1totalcard.dart';
import 'cards/pc2totalcard.dart';

Widget mainColumn = Column(
  children: <Widget>[
    sensorRow,
    sensorRow2,
    sensorRow3,
    sensorRow4,
    // sensorRow,
  ]
);

Widget sensorRow = Row(
  children: <Widget>[
    Expanded(
      child: Pc1LastMotionCard(),
    ),
    Expanded(
      child: Pc1LastStillCard(),
    ),
  ]
);

Widget sensorRow2 = Row(
  children: <Widget>[
    Expanded(
      child: Pc2LastMotionCard(),
    ),
    Expanded(
      child: Pc2LastStillCard(),
    ),
  ]
);


Widget sensorRow3 = Row(
  children: <Widget>[
    Expanded(
      child: HealthCard(),
    ),
    Expanded(
      child: EventCard(),
    ),
  ]
);

Widget sensorRow4 = Row(
  children: <Widget>[
    Expanded(
      child: PingCard(),
    ),
    Expanded(
      child: Pc1TotalCard(),
    ),
    Expanded(
      child: Pc2TotalCard(),
    ),
  ]
);