
import 'package:botanik_bahcem/features/bitkisulama/data/repositories/storage_service/shared_preferences_storage.dart';
import 'package:botanik_bahcem/features/bitkisulama/data/repositories/storage_service/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/pages/bitkisulama_logic.dart';




final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<TimerPageManager>(() => TimerPageManager());

  // service layer
  getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());
}