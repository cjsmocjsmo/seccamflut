import 'package:flutter/material.dart';
import 'cards/eventscard.dart';
import 'cards/healthcard.dart';
import 'cards/motioncard.dart';
import 'cards/pingcard.dart';
import 'cards/stillcard.dart';
import 'cards/pc1totalcard.dart';
import 'cards/pc2totalcard.dart';


Widget mainColumn = Column(
  children: <Widget>[
    sensorRow,
    sensor2Row,
    sensor3Row,
  ]
);

Widget sensorRow = Row(
  children: <Widget>[
    Expanded(
      child: MotionCard(),
    ),
    Expanded(
      child: StillCard(),
    ), 
    
  ]
);

Widget sensor2Row = Row(
  children: <Widget>[
    Expanded(
      child: HealthCard(),
    ),
    Expanded(
      child: EventCard(),
    ),
  ]
);

Widget sensor3Row = Row(
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