import 'dart:convert';
import 'dart:developer';

extension MapExtension on Map {
  String toRawJson() {
    try {
      return json.encode(this);
    } catch (e, s) {
      log('json encode error::: $e \n $this', stackTrace: s);
      return '';
    }
  }
}
