import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/utils/responsive.dart';

void main() {
  testWidgets('isTablet is false on narrow phones', (tester) async {
    late bool tablet;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Builder(
          builder: (context) {
            tablet = isTablet(context);
            return const SizedBox();
          },
        ),
      ),
    );
    expect(tablet, isFalse);
  });

  testWidgets('isTablet is true when shortestSide >= 600', (tester) async {
    late bool tablet;
    late int columns;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(800, 1024)),
        child: Builder(
          builder: (context) {
            tablet = isTablet(context);
            columns = gridCrossAxisCount(context);
            return const SizedBox();
          },
        ),
      ),
    );
    expect(tablet, isTrue);
    expect(columns, greaterThanOrEqualTo(2));
  });

  testWidgets('horizontalPadding is larger on tablet', (tester) async {
    late double phonePad;
    late double tabletPad;

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(375, 812)),
        child: Builder(
          builder: (context) {
            phonePad = horizontalPadding(context);
            return const SizedBox();
          },
        ),
      ),
    );

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(834, 1194)),
        child: Builder(
          builder: (context) {
            tabletPad = horizontalPadding(context);
            return const SizedBox();
          },
        ),
      ),
    );

    expect(phonePad, 20);
    expect(tabletPad, 32);
  });
}
