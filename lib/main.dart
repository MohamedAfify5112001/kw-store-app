import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kw_store_app/app/kw_store.dart';
import 'package:kw_store_app/core/locator/app_locator.dart';
import 'package:kw_store_app/core/utils/observer/bloc_observer.dart';
import 'package:kw_store_app/local/hive_db/init_hive.dart';
import 'package:kw_store_app/local/isar_db/isar_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocator.initAppLocator();
  await Hive.initFlutter();
  await HiveDao.initFavoriteHive();
  await CartIsarDatabase.initIsar();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const KwStoreApp());
}
