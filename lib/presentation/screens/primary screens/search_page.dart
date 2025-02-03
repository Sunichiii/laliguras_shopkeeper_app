import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/vegetable_provider.dart';
import '../../../views/products/vegetable_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String _selectedCategory = "All";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch vegetables on page load
    final vegetableProvider = Provider.of<VegetableProvider>(context, listen: false);
    vegetableProvider.fetchVegetables();
  }

  @override
  Widget build(BuildContext context) {
    final vegetableProvider = Provider.of<VegetableProvider>(context);

    // Filter vegetables based on search and category
    final filteredVegetables = vegetableProvider.vegetables.where((vegetable) {
      final matchesCategory = _selectedCategory == "All" ||
          vegetable.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesSearch = _searchController.text.isEmpty ||
          vegetable.name.toLowerCase().contains(_searchController.text.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location and Search Bar
            Row(
              children: [
                const Icon(Icons.location_on, color: AppColors.primary),
                const SizedBox(width: 8.0),
                Text("Gausala, KTM", style: Theme.of(context).textTheme.titleMedium),
                IconButton(
                  icon: const Icon(Icons.expand_more, color: AppColors.primary),
                  onPressed: () {
                    // Handle location change
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                filled: true,
                fillColor: AppColors.background, // Background color of the box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.black), // Black border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey), // Black border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.black, width: 2.0), // Bold black border
                ),
              ),
              onChanged: (value) => setState(() {}), // Update search results
            ),
            const SizedBox(height: 16.0),

            // Category Filters
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCategoryChip(context, "All"),
                _buildCategoryChip(context, "Vegetables"),
                _buildCategoryChip(context, "Roots"),
                _buildCategoryChip(context, "Leafy"),
                _buildCategoryChip(context, "Spices"),
              ],
            ),
            const SizedBox(height: 16.0),

            // Vegetable Grid
            if (vegetableProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (vegetableProvider.errorMessage != null)
              Center(
                child: Text(
                  vegetableProvider.errorMessage!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            else if (filteredVegetables.isEmpty)
                Center(
                  child: Text(
                    "No vegetables found.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              else
                Expanded(
                  child: VegetableGrid(vegetables: filteredVegetables),
                ),
          ],
        ),
      ),
    );
  }

  // Helper method to build category chips
  Widget _buildCategoryChip(BuildContext context, String category) {
    final isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.grey,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.black, // Black border for unselected
            width: 1.0,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
