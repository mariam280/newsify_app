import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.onSubmitted});
  final void Function(String)? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
 late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      child: TextField(
        cursorColor: Colors.black,
        controller: searchController,
        decoration: InputDecoration(
      hintText: 'Search',
      fillColor: Colors.grey[200],
      filled: true,
      hintStyle: TextStyle(color: Colors.grey), 
      prefixIcon: Icon(Icons.search,color: Colors.grey,), 
      suffixIcon: IconButton(onPressed: (){
        searchController.clear();
      }, icon: Icon(Icons.cancel_outlined,
      color: searchController.text.isEmpty ? Colors.grey : Colors.black,)), 
      border: buildBorder(),
      enabledBorder: buildBorder(),
      focusedBorder: buildBorder(),
        ),
        
        onSubmitted: widget.onSubmitted,
        ),
    );}

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
    borderRadius: BorderRadius.circular(60),
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
  );
  }
}