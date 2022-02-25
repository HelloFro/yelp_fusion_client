import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify(name: 'Env')
abstract class Env {
    static const api_key = _Env.api_key;
}