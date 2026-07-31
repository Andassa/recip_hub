import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/mock_recipes.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/form_validators.dart';
import '../utils/responsive.dart';
import '../widgets/primary_button.dart';

/// Écran 3 : formulaire d'ajout avec Form + GlobalKey + validateurs
/// (titre, catégorie, durée obligatoires).
class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();

  String? _category;
  String _difficulty = 'Easy';

  static const _difficulties = ['Easy', 'Medium', 'Hard'];

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await context.read<RecipeProvider>().addRecipe(
      title: _titleController.text.trim(),
      category: _category!,
      duration: int.parse(_durationController.text.trim()),
      difficulty: _difficulty,
      description: _descriptionController.text.trim(),
      ingredients: _ingredientsController.text.split('\n'),
    );

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Recipe added successfully!')));
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    final padding = horizontalPadding(context);
    final categories = kRecipeCategories
        .where((c) => c != 'All')
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.goNamed('home'),
        ),
        title: Text(
          'Add Recipe',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label('Title'),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Recipe title'),
                validator: FormValidators.requiredTitle,
              ),
              const SizedBox(height: 16),
              _label('Category'),
              DropdownButtonFormField<String>(
                // ignore: deprecated_member_use
                value: _category,
                decoration: const InputDecoration(hintText: 'Select category'),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value),
                validator: FormValidators.requiredCategory,
              ),
              const SizedBox(height: 16),
              _label('Duration (minutes)'),
              TextFormField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'e.g. 20'),
                validator: FormValidators.positiveDuration,
              ),
              const SizedBox(height: 16),
              _label('Difficulty'),
              DropdownButtonFormField<String>(
                // ignore: deprecated_member_use
                value: _difficulty,
                items: _difficulties
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) setState(() => _difficulty = value);
                },
              ),
              const SizedBox(height: 16),
              _label('Description / Steps'),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Describe the recipe or steps (one per line)',
                ),
              ),
              const SizedBox(height: 16),
              _label('Ingredients'),
              TextFormField(
                controller: _ingredientsController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'One ingredient per line',
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'Save Recipe',
                showArrow: false,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
