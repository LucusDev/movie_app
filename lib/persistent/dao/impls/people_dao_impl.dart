import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/persistent/dao/people_dao.dart';

class PeopleDaoImpl extends PeopleDao {
  @override
  List<PeopleVO> getAllPeople() {
    return getBox().values.toList();
  }

  @override
  void saveAllPeople(List<PeopleVO> people) {
    getBox()
        .putAll(people.asMap().map((key, value) => MapEntry(value.id, value)));
  }
}
