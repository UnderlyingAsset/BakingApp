import 'package:flutter/material.dart';


///The general text form field decoration appearance is defined here and
///predominantly used for the TextFormFields found on the login and sign-up
///screens.

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.zero,
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue,)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);