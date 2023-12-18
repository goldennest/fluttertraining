import 'package:flutter/material.dart';
import 'package:vkmusic/utils/common_export.dart';

class Search extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value) onchanged;
  final Function() submit;

  const Search({
    super.key,
    required this.controller,
    required this.onchanged,
    required this.submit,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppTheme.primarycolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                blurRadius: 2,
                spreadRadius: 0.0,
                offset: Offset(
                  1.0,
                  1.0,
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                widget.onchanged(value);
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: IconButton(
                    onPressed: () => {widget.submit},
                    color: AppTheme.primarycolor,
                    iconSize: 30,
                    padding: EdgeInsets.only(bottom: 8),
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
                hintText: "Search favourite music",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: AppTheme.primarycolor,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          )),
    );
  }
}
