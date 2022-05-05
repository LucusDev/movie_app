import 'package:hive/hive.dart';

abstract class Dao<DbType> {
  final String _name;
  const Dao(this._name);
  Box<DbType> getBox() {
    return Hive.box<DbType>(_name);
  }
}
