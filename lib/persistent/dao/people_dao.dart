import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/persistent/dao.dart';
import 'package:movie_app/persistent/hive_constants.dart';

abstract class PeopleDao extends Dao<PeopleVO> {
  const PeopleDao() : super(kPeopleVOBoxName);

  void saveAllPeople(List<PeopleVO> people);

  Future<List<PeopleVO>> getAllPeople();
}
