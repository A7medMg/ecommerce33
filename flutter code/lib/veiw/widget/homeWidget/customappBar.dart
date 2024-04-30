import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearch;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomHomeAppBar({super.key, required this.title, required this.onPressedSearch,required this.onPressedNotification,required this.onPressedFavorite, this.onChanged, required this.mycontroller,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged:onChanged ,
              decoration: InputDecoration(
                prefixIcon: IconButton(onPressed: onPressedSearch,icon: const Icon(Icons.search_outlined)),
                hintText: title,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedNotification,
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: const Icon(
                Icons.favorite,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
