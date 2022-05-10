import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';
import 'package:movie_app/features/home/view/home_page.dart';
import 'package:movie_app/features/home/view/widgets/widgets.dart';
import 'package:movie_app/main.dart';

import 'test_constants.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await hiveInit();

  group("end to end", () {
    testWidgets("now playing movie section to detail page", (tester) async {
      //add homepage
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //find now playing section
      expect(find.byType(NowPlayingMovieSectionView), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
      //tap on the movie
      await tester.tap(find.text(kNowPlayingMovieName));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
      //reach to detail page
      expect(find.byType(DetailPage), findsOneWidget);

      await tester.pumpAndSettle();

      detailTest(
        vote: kNowPlayingMovieVote,
        score: kNowPlayingMovieScore,
        storyline: kNowPlayingMovieStoryLine,
        actor: kNowPlayingMovieActor,
        creator: kNowPlayingMovieCreator,
        time: kNowPlayingMovieTime,
        year: kNowPlayingMovieYear,
        genres: kNowPlayingMovieGenres,
        premire: kNowPlayingMoviePremire,
        production: kNowPlayingMovieProduction,
      );
    });
    testWidgets("popular section to detail page", (tester) async {
      ///add homepage
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //find popular section
      expect(find.byType(PopularMovieSectionView), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
      //tap on popular movie
      await tester.tap(find.text(kPopularMovieName));
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 5));

      //reach to detail page
      expect(find.byType(DetailPage), findsOneWidget);

      await tester.pumpAndSettle();

      detailTest(
        vote: kPopularMovieVote,
        score: kPopularMovieScore,
        storyline: kPopularMovieStoryLine,
        actor: kPopularMovieActor,
        creator: kPopularMovieCreator,
        time: kPopularMovieTime,
        year: kPopularMovieYear,
        genres: kPopularMovieGenres,
        premire: kPopularMoviePremire,
        production: kPopularMovieProduction,
      );
    });
    testWidgets("genre section to detail page", (tester) async {
      //Add Home Page
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //Find Genre Section
      expect(find.byType(GenreMovieRow), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));

      //Scroll to Genre Section
      await tester.dragUntilVisible(
        find.text(kGenre),
        find.byType(HomePage),
        const Offset(0, 20),
      );

      //Click on Some Genre
      await tester.tap(find.text(kGenre));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      //Click on a Movie
      await tester.tap(find.text(kMovieByGenreName));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      //Reach to detail page
      expect(find.byType(DetailPage), findsOneWidget);
      detailTest(
        vote: kMovieByGenreVote,
        score: kMovieByGenreScore,
        storyline: kMovieByGenreStoryLine,
        actor: kMovieByGenreActor,
        creator: kMovieByGenreCreator,
        time: kMovieByGenreTime,
        year: kMovieByGenreYear,
        genres: kMovieByGenreGenres,
        premire: kMovieByGenrePremire,
        production: kMovieByGenreProduction,
      );
    });
    testWidgets("showcase section to detail page", (tester) async {
      //add HomePage
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //Find ShowCaseRow
      expect(find.byType(ShowCaseRow), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));

      //Scroll to ShowCase Section
      await tester.dragUntilVisible(
        find.text(kShowCaseMovie),
        find.byType(HomePage),
        const Offset(0, 20),
      );
      //Tap on Movie
      await tester.tap(find.text(kShowCaseMovie));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      //Reach to Detail Page
      expect(find.byType(DetailPage), findsOneWidget);
      await tester.pumpAndSettle();
      detailTest(
        actor: kShowCaseMovieActor,
        creator: kShowCaseMovieCreator,
        score: kShowCaseMovieScore,
        storyline: kShowCaseMovieStoryLine,
        vote: kShowCaseMovieVote,
        time: kShowCaseMovieTime,
        year: kShowCaseMovieYear,
        genres: kShowCaseMovieGenres,
        premire: kShowCaseMoviePremire,
        production: kShowCaseMovieProduction,
      );
    });
    testWidgets("best actors section", (tester) async {
      ///add homepage
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      //find best actors section
      expect(find.byType(PopularMovieSectionView), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      //Scroll to best actors Section
      await tester.dragUntilVisible(
        find.text(kBestActor),
        find.byType(HomePage),
        const Offset(0, -100),
      );
      expect(find.text(kBestActor), findsWidgets);
    });
  });
}

void detailTest({
  required String vote,
  required String score,
  required String storyline,
  required String actor,
  required String creator,
  required String year,
  required String time,
  required List<String> genres,
  required String premire,
  required String production,
}) {
  //VOTE
  // expect(find.text(vote), findsWidgets);
  //SCORE
  // expect(find.text(score), findsWidgets);
  //STORYLINE
  expect(find.text(storyline), findsWidgets);
  //ACTOR
  expect(find.text(actor), findsWidgets);
  //CREATOR
  expect(find.text(creator), findsWidgets);
  //YEAR
  expect(find.text(year), findsWidgets);
  //TIME
  expect(find.text(time), findsWidgets);
  //PREMIRE
  expect(find.text(premire), findsWidgets);
  //PRODUCTION
  expect(find.text(production), findsWidgets);
  //GENRES
  for (String genre in genres) {
    expect(find.text(genre), findsWidgets);
  }
  expect(find.text(genres.join(" , ")), findsWidgets);
}
