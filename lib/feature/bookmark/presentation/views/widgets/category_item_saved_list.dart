import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/feature/bookmark/presentation/manager/display_news_item_cubit/display_news_item_cubit.dart';
import 'package:newsify/feature/home/presentation/views/widgets/caregory_item.dart';

class CategoryItemSavedList extends StatefulWidget {
  const CategoryItemSavedList({super.key, required this.onCategorySelected});
 final Function(String) onCategorySelected;
  @override
  State<CategoryItemSavedList> createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemSavedList> {
  final List<String> items = [
    'General',
    'Technology',
    'Sports',
    'Health',
    'Science',
    'Business',
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      final defaultCategory = items[0].toLowerCase();
      widget.onCategorySelected(defaultCategory);
      BlocProvider.of<DisplayNewsItemCubit>(context)
          .displayNewsItem(category: defaultCategory);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
              setState(() {
                selectedIndex = index;
              });
             final selectedCategory = items[index].toLowerCase();
             widget.onCategorySelected(selectedCategory); 
             BlocProvider.of<DisplayNewsItemCubit>(context).displayNewsItem(category: selectedCategory);
            },
            child: CategoryItem(
              isSelected: index == selectedIndex,
              text: items[index],
            ),
          );
        },
      ),
    );
  }
}
