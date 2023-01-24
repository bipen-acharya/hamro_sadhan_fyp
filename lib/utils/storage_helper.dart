// import 'dart:developer';

// import 'package:get_storage/get_storage.dart';
// import 'package:hamro_sadhan/utils/storage_keys.dart';

// class StorageHelper {

//   static DateTime? getAppLoadedDate() {
//     try {
//       final box = GetStorage();
//       DateTime dateTime = DateTime.parse(box.read(StorageKey.APP_LOAD_DATE));
//       return dateTime;
//     } catch (e, s) {
//       log(e.toString());
//       log(s.toString());
//       return null;
//     }
//   }

// }