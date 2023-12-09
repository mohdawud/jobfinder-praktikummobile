import 'package:flutter/material.dart';
import 'package:jobfinder/theme/colors.dart';

class CategoriesList extends StatefulWidget {
  final String category;
  final Function(String) onTap;
  final bool isSelected;

  CategoriesList({
    required this.category,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return buildCategoryCard(widget.category);
  }

  Widget buildCategoryCard(String categoryName) {
    return GestureDetector(
      onTap: () {
        widget.onTap(categoryName);
      },
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: widget.isSelected ? primaryColor : Colors.grey[400],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
