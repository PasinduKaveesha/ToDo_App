import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final Function(String) onsearchChanged;
  final TextEditingController searchController;
  const Searchbar({super.key, required this.onsearchChanged,required this.searchController});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search tasks...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.amber,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      onChanged: widget.onsearchChanged,
    ));
  }
}
