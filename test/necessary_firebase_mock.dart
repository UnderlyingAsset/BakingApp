// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

///In order to run widget tests, a mock version of Firebase must be created
///so that Firebase appears to be initialized upon running.  This code
///is taken from an online resource which was specifically set up to
///assist in mocking Firebase wtihin unit tests.  As such, this code
///was not written by the developer and therefore retains the copyright
///info listed above.  All tests are written by the developer, but this
///initialization of Firebase necessary to run them was not.


typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}