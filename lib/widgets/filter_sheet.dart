import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import 'category_chip.dart';
import 'primary_button.dart';

/// Bottom sheet "Filter Search" pixel-perfect Figma.
Future<void> showFilterSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const FilterSheet(),
  );
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late String _time;
  int? _rate;
  late String _category;

  static const _times = ['All', 'Newest', 'Oldest', 'Popularity'];
  static const _rates = [5, 4, 3, 2, 1];
  static const _categories = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner',
    'Chinese',
    'Local Dish',
    'Fruit',
    'Breakfast',
    'Spanish',
    'Lunch',
  ];

  @override
  void initState() {
    super.initState();
    final provider = context.read<RecipeProvider>();
    _time = provider.timeFilter;
    _rate = provider.rateFilter;
    _category = provider.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 32),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filter Search',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Time'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _times
                  .map(
                    (t) => CategoryChip(
                      label: t,
                      isSelected: _time == t,
                      onTap: () => setState(() => _time = t),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Rate'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _rates
                  .map(
                    (r) => CategoryChip(
                      label: '$r',
                      showStar: true,
                      isSelected: _rate == r,
                      onTap: () => setState(() => _rate = r),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Category'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _categories
                  .map(
                    (c) => CategoryChip(
                      label: c,
                      showStar: c == 'Dinner',
                      isSelected: _category == c,
                      onTap: () => setState(() => _category = c),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Filter',
              showArrow: false,
              borderRadius: 10,
              onPressed: () {
                context.read<RecipeProvider>().applyAdvancedFilters(
                  timeFilter: _time,
                  rateFilter: _rate,
                  category: _category,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
