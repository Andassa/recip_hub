import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/router/app_router.dart';

void main() {
  test('named routes resolve to expected paths', () {
    expect(appRouter.namedLocation('splash'), '/splash');
    expect(appRouter.namedLocation('signIn'), '/sign-in');
    expect(appRouter.namedLocation('signUp'), '/sign-up');
    expect(appRouter.namedLocation('home'), '/home');
    expect(appRouter.namedLocation('favorites'), '/favorites');
    expect(appRouter.namedLocation('notifications'), '/notifications');
    expect(appRouter.namedLocation('profile'), '/profile');
    expect(appRouter.namedLocation('search'), '/search');
    expect(appRouter.namedLocation('addRecipe'), '/add-recipe');
    expect(appRouter.namedLocation('settings'), '/settings');
    expect(
      appRouter.namedLocation('detail', pathParameters: {'id': '1'}),
      '/recipe/1',
    );
    expect(
      appRouter.namedLocation('reviews', pathParameters: {'id': '1'}),
      '/recipe/1/reviews',
    );
  });
}
