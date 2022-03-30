import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocator() {
  //API
  //locator.registerFactory<ApiClient>(() => ApiClient());

  //Controller
  //locator.registerSingleton<Application>(Application());

  //Repository
//   locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
//   locator.registerLazySingleton<UserRepository>(() => UserRepository());
//   locator.registerLazySingleton<PreferenceRepository>(
//       () => PreferenceRepository());
//   locator.registerLazySingleton<DbConfig>(() => DbConfig());
//   locator.registerLazySingleton<WalletRepository>(() => WalletRepository());
// }

// List<BaseRepository> repositories = [
//   locator.get<AuthRepository>(),
//   locator.get<UserRepository>(),
//   locator.get<PreferenceRepository>(),
// ];
}
