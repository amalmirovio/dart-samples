// Copyright (c) 2013-2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Use `HttpServer.bind()` method to bind to a port and the HttpServer
/// `listen()` method to listen for connections.  Respond to an `HttpRequest`
/// using the `response` property.

import 'dart:io';

void main() {
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    print("Serving at ${server.address}:${server.port}");
    server.listen((HttpRequest request) {
      request.response
        ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
        ..write('Hello, world')
        ..close();
    });
  });
}