import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/home/presentation/views/widgets/caregory_item.dart';

class CategoryItemList extends StatefulWidget {
  const CategoryItemList({super.key});

  @override
  State<CategoryItemList> createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemList> {
  final List<String> items = [
    'General',
    'Business',
    'Sports',
    'Health',
    'Science',
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    final defultCategory = items[0].toLowerCase(); 
             context.read<NewsCubit>().fetchCategoryNews(category: defultCategory);
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
             context.read<NewsCubit>().fetchCategoryNews(category: selectedCategory);
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
