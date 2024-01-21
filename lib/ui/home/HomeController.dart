import 'package:flutter/material.dart';
import '../bottom_sheet/CustomBottomSheet.dart';

class HomeController{
  BuildContext context;

  HomeController({required this.context});

  void handleOpenBottomSheet(){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0))),
        builder: (context) => CustomBottomSheet());
  }
}