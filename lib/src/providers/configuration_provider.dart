import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_retrofit/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configurationsProvider = FutureProvider<ConfigurationModel>((_) async {
  final content = json.decode(
    await rootBundle.loadString('assets/configurations.json'),
  ) as Map<String, Object?>;

  return ConfigurationModel.fromJson(content);
});

// final configs = await _read(configurationsProvider.future);
