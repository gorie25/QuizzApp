

import 'package:flutter/material.dart';

double getHeight(context) => MediaQuery.of(context).size.height;
double getWidth(context) => MediaQuery.of(context).size.width;
double paddingCustom(context) => getWidth(context) * 0.05;