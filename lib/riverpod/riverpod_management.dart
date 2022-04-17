import 'package:flutter_project/riverpod/home_riverpod.dart';
import 'package:flutter_project/riverpod/login_riverpod.dart';
import 'package:flutter_project/riverpod/product_riverpod.dart';
import 'package:flutter_project/riverpod/register_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final registerRiverpod = ChangeNotifierProvider((_) => RegisterRiverpod());
final homeRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());
final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());
