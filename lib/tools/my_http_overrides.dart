// ignore_for_file: slash_for_doc_comments

import 'dart:io';

/**
 * [ Handshake error in client ]
 * For Solve : [ HandshakeException ] | CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate(handshake.cc:393)
 * https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
 * **/
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}