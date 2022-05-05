import 'package:flutter/material.dart';


 InputDecoration textInputDecoration= InputDecoration(
  fillColor: const Color(0xFFD6D6D6),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white,width: 2,),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent,width: 2),
  ),
);